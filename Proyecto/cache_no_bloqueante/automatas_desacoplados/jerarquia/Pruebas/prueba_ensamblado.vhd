library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use IEEE.std_logic_textio.all;
use std.env.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.peticiones_cache_pkg.all;
use work.controlador_pkg.all;

use work.procedimientos_peticiones_pkg.all;

use work.impri_memoria_pkg.all;
use work.impri_cache_pkg.all;
--use work.impri_traza_pkg.all;

entity prueba_ensamblado is
    generic(pasoapaso: integer range 0 to 1:= 0;
			   imprimir_traza: integer:= 0;
			   imprimir_CACHE: integer:= 1;
			   imprimir_MEMORIA: integer:= 1;
			   comprobar_load: integer:= 1);
end prueba_ensamblado;
  
architecture prueba of prueba_ensamblado is

component jerarquia is 
 port(reloj: in std_logic;
      pcero: in std_logic;
		pet_proc: in tp_peticion; 
		resp_cache: out tp_respuesta;
		cache_lista: out std_logic);
end component;

signal reloj, pcero: std_logic;

signal peticion: tp_peticion;
signal respuesta: tp_respuesta;
signal pet_listo: std_logic;

signal s_mem_etiq: tp_m_ET;
signal s_mem_estado: tp_m_EST;
signal s_mem_datos: tp_m_DAT;
signal s_mem_memoria: RAM_mem;

signal s_derechos_acceso: std_logic;
signal s_estado_fallo: tipoestado_fallo;
signal s_estado_expulsion: tipoestado_expulsion;
signal s_pet: tp_contro_e;

signal s_AF: std_logic;
signal s_est: st_estado;
--signal s_control: tp_contro_cam_cntl;

signal s_peticion: tp_peticion;

signal s_esperado: st_palabra_dat;

signal s_bex_val: std_logic;
signal s_final_contador_bex: std_logic;
signal s_contador_bex: tam_contador_bex;

signal inicializacion: std_logic;
signal parar: std_logic;
signal finaltraza: std_logic:= '0';

shared variable final : boolean := false;
signal ciclo: integer:= 0;

file S, S_pro_cons: text;

constant fichero: string := "../../../Resultados/resultados_ejecucion.txt";
constant fichero_pro_cons: string := "../../../Resultados/productor_consumidor.txt";

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

-- Procedimiento para esperar a que se vacie el bex al final de la simulacion --
procedure esperar_contador(signal reloj: in std_logic; signal validez_bex: in std_logic; signal final_contador: in std_logic) is 
begin 
    if (validez_bex = '1') then 
	     wait until final_contador = '1';
        wait_until_falling_edges(reloj, 7); -- 7 valor hardcodeado, 4 ciclos acceso a memoria + 3 falling edges para llegar al estado DESEX
	 end if;
end procedure;

begin

ensamblado: jerarquia port map(reloj => reloj, pcero => pcero, pet_proc => peticion, resp_cache => respuesta, cache_lista => pet_listo);

-- captura de senyales internas al disenyo
-- cache: campos etqiuetas, estado y datos
	s_mem_etiq <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.camino_datos_cache.etiquetas.memoria_etiquetas.campo_etiquetas: tp_m_ET >>;
	s_mem_estado <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.camino_datos_cache.estado.campo_estado: tp_m_EST >>;
	s_mem_datos <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.camino_datos_cache.datos.memoria_datos.campo_datos: tp_m_DAT >>;
-- memoria
	s_mem_memoria <= << signal .prueba_ensamblado.ensamblado.memoria.memoria_principal.memoria.memoria: RAM_mem >>;
-- controlador de cache: derechos de acceso, estado y peticion que se procesa
	s_derechos_acceso <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.controladores.automata_acceso.derechos_acceso: std_logic >>;
	s_estado_fallo <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.controladores.automata_fallo.estado: tipoestado_fallo >>;
	s_estado_expulsion <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.controladores.automata_expulsion.estado: tipoestado_expulsion >>;
--	s_pet <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.contro.pet: tp_contro_e >>;
-- controlador de cache: senyales de entrada acierto/fallo, estado del bloque accedido
	s_AF <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.camino_datos_cache.etiquetas.AF: std_logic >>;
	s_est <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.camino_datos_cache.estado.DL: st_estado >>;
-- controlador de cache: senyales de control
	--s_control <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.controladores.automata_fallo.s_control: tp_contro_cam_cntl >>;
-- cache: peticion que procesa la cache
	s_peticion <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.peticion: tp_peticion >>;
-- contador bex: señal valido del buffer de expulsiones 
   s_bex_val <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.bex.validez_bex: std_logic >>;
	s_final_contador_bex <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.bex.cont_bex.final: std_logic >>;
	s_contador_bex <= << signal .prueba_ensamblado.ensamblado.cache_no_bloqueante.cach.cache.bex.cont_bex.bex_counter: tam_contador_bex >>;
	
productor: process 
variable v_DIR: natural range 0 to tam_EspacioLogico;
variable v_DATO: natural range 0 to tam_palabra;
begin
-- fichero resumen
 	file_open(S_pro_cons,fichero_pro_cons,write_mode); 
	cabecera_resumen (fichero_pro_cons);
	file_close(S_pro_cons);

-- fichero de traza     
	if (imprimir_traza = 1) then
		file_open(S,fichero,write_mode); 
		--cabecera_traza (fichero);
		file_close(S);
	end if;

-- puesta a cero
	proc_puesta_cero (reloj, pcero, peticion, pet_listo, ciclo, fichero_pro_cons);

-- inicio de peticiones

   -- Prueba de peticiones basicas
	v_DIR := 0; 
	v_DATO := 0;
	inicio (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	v_DIR := 0;
	v_DATO := 2;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DIR := 1;
	v_DATO := 1;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DIR := 16;
	v_DATO := 0;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DATO := 20;
   Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DIR := 0;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DATO := 4;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

-- Secuencia de peticiones que provocan el problema de la perdida de peticiones --
-- Se procesa una peticion de lectura de bloque a la direccion 2 que provoca fallo de cache y en paralelo se van --
-- procesando accesos a la direccion 0 que dan acierto --	
	v_DIR := 2;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DIR := 0;
	v_DATO := 1;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DATO := 2;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	v_DATO := 3; -- Se pierde
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	v_DATO := 4; -- Se pierde
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

-- Esta parte del programa de pruebas se comenta para que no genere ruido en la simulacion --
--	-- Bucle para rellenar todos los contendores de cache
--	for i in 0 to 15 loop
--	    v_DIR := i;
--		 v_DATO := i + 11;
--		 Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	end loop;
--	
--	-- Bucle para rellenar todos los contenedores de la cache y generar expulsiones
--	for i in 16 to 31 loop 
--	    v_DIR := i;
--		 v_DATO := i + 5;
--		 Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	end loop;
--
---- Bucle para comprobar los resultados del primer bucle y generar expulsiones
--	for i in 0 to 15 loop 
--	    v_DIR := i;
--		 v_DATO := i + 11;
--		 Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	end loop;
--	
--	-- Bucle para comprobar los resultados del segundo bucle 
--	for i in 16 to 31 loop 
--	    v_DIR := i;
--		 v_DATO := i + 5;
--		 Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	end loop;
--	
--	for i in 16 to 31 loop 
--	    v_DIR := i;
--		 v_DATO := i * 2;
--		 Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	end loop;
--	
--	-- Probando direcciones altas
--	v_DIR := 65535;
--	v_DATO := 255;
--	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--
--	v_DIR := 32767;
--	v_DATO := 255;
--	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	
--	-- Peticion a memoria de lectura de bloque solapado con una expulsion
--	v_DIR := 32;
--	v_DATO := 26;
--	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
--	
--	v_DIR := 36;
--	v_DATO := 5;
--	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);
	
	no_hay_peticion (reloj, peticion, pet_listo, ciclo, fichero_pro_cons);
	no_hay_peticion (reloj, peticion, pet_listo, ciclo, fichero_pro_cons);
	
	esperar_contador(reloj, s_bex_val, s_final_contador_bex);
	
	interface_productor(reloj, pet_listo);

	report "prueba finalizada";

	parar <= '1';
	wait;       
end process;


consumidor: process is
variable v_s_peticion: tp_peticion;
variable esperado, consumo: st_palabra_dat;
variable ciclod:integer;
file S_pro_cons: text;
variable Lo, l : line;
begin
--	capturar valor esperado en una instruccion load (s_esperado)
	interface_productor(reloj, pet_listo);
	if peticion.acc = '1' and peticion.pe = '0' and peticion.ini = '0' then
		esperado := s_esperado; --ver

		interface_consumidor(reloj, respuesta.valido);

		consumo := respuesta.dato_leido;

-- Actualizar fichero. Instante en el cual se consume el valor del load 
		ciclod:= ciclo'delayed(0 fs);
		write(l, ciclod, right, 5);
		write (l, string'("consumo. valor"), right, 20+7); 
		hwrite(l, consumo, right, 6);
		write (l, string'("load  "), right, 8); 
		hwrite(l, s_peticion.dir, right, 6);
		file_open(S_pro_cons,fichero_pro_cons,append_mode); 
		writeline (S_pro_cons, l);
		file_close(S_pro_cons);

		if comprobar_load = 1 then
-- comprobacion del valor leido con el esperado
			if (respuesta.dato_leido /= esperado) then 
				assert false report "valor no esperado" severity warning;
				write(Lo, string'(", leido:   "));
				write(Lo, respuesta.dato_leido);
				write(Lo, string'(", esperado:   "));
				write(Lo, esperado);
				writeline(output, Lo);

				write(l, string'("valor no esperado "));
				write(l, string'(", leido:   "));
				write(l, respuesta.dato_leido);
				write(l, string'(", esperado:   "));
				write(l, esperado);
				file_open(S_pro_cons,fichero_pro_cons,append_mode); 
				writeline (S_pro_cons, l);
				file_close(S_pro_cons);
			end if;
		end if;
	end if;
end process;


--traza: if imprimir_traza = 1 generate
--impri_accesos: process
--
--variable v_peticion: tp_peticion;
--variable v_respuesta: tp_respuesta;
--variable v_pet_listo: st_cache_listo;
--
--variable v_derechos_acceso: std_logic;
--variable v_estado: tipoestado;
--variable v_pet: tp_contro_e;
--
--variable v_AF: std_logic;
--variable v_est: std_logic;
--variable v_control, v_control_actuacion: tp_contro_cam_cntl;
--
--variable v_s_peticion: tp_peticion;
--
--variable ciclod:integer;
--variable cnt, cnt_sigue: integer := 0;
--
--begin
--	wait until rising_edge(reloj);
--	v_pet_listo:= pet_listo'delayed(0 fs);
--	if ciclo >= 5 and finaltraza = '0' then
---- valor de las senyales en el instante previo al flanco ascendente
--		v_peticion:= peticion'delayed(0 fs);
--		v_respuesta:= respuesta'delayed(0 fs);
--		v_estado:= s_estado'delayed(0 fs);
--		v_pet:= s_pet'delayed(0 fs);
--		v_AF:= s_AF'delayed(0 fs);
--
--		v_est:= s_est'delayed(0 fs);
--
--		v_control:= s_control'delayed(0 fs);
--		v_s_peticion := s_peticion'delayed(0 fs);
--
--		ciclod:= ciclo'delayed(0 fs);
--
---- como los campos de cache y memoria no se actualizan en cada ciclo no es necesario "delayed"
--		impri_traza (v_pet_listo, v_s_peticion, v_peticion, v_AF, v_est, v_estado,
--					s_mem_etiq, s_mem_estado, s_mem_datos, s_mem_memoria,
--					v_control_actuacion,
-- 					ciclod, cnt, cnt_sigue, fichero);
--		v_control_actuacion := v_control;
--	end if;
--
--	if parar = '1' then
--		finaltraza <= '1';
--	end if;
--
--end process;
--end generate traza;


finalizar: process is
begin
	wait until parar = '1';
	final := true;
	if imprimir_cache = 1 then
		impri_cache(s_mem_etiq, s_mem_estado, s_mem_datos, fichero_pro_cons);
	end if;
	if imprimir_memoria = 1 then
		impri_memoria(s_mem_memoria, fichero_pro_cons);
	end if;
end process;


relojciclo: process  is
begin
  if final = false then
	reloj <= '0';
	wait for 40 ns;
	ciclo <= ciclo +1;
	reloj <= '1';
	wait for 40 ns;
	if pasoapaso = 1 then
		stop(0);
	end if;
  else
	wait;
  end if;
end process relojciclo;

end;
