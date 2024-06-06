library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity controlador is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 L2_lista: in std_logic;
		 resp_L2: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 resp: out tp_contro_s;
		 pet_L2: out tp_cntl_L2_s);
end controlador;

architecture comportamiento of controlador is 

signal estado, prxestado: tipoestado;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;
signal expulsion_lectura: std_logic; -- Senyal para detectar las expulsiones de bloques no modificados

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST = Contenedor_L or info_estado.EST = Contenedor_M)) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_M) else '0';
expulsion_lectura <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_L) else '0';

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DES0;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, pet, info_estado, estado, resp_L2, derechos_acceso, expulsion_modificado, L2_lista, expulsion_lectura)
variable v_estado: tipoestado;
begin 
   v_estado := estado;
	if (pcero = not puesta_cero) then 
	    case estado is
		      when DES0 =>
				    if (hay_peticion_procesador(pet)) then
					     if (hay_peticion_ini_procesador(pet)) then 
					         v_estado := INI;
						  else 
						      v_estado := CMPET;
						  end if;
					 end if;
					 
				when INI =>
				    v_estado := ESCINI;
					 
				when ESCINI =>
				    v_estado := DES;
					 
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
					       v_estado := CMPET;
						 end if;	
					 end if;
				
				when CMPET =>
				    if (es_acierto_lectura(pet, derechos_acceso)) then 
					     v_estado := LEC;
					 elsif (es_acierto_escritura(pet, derechos_acceso)) then 
					     v_estado := ESC;
					 elsif (es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura)) then
					     v_estado := LVIC;
					 elsif (es_fallo(derechos_acceso)) then 
					     v_estado := PBL;
				    end if;
					 
				when LVIC => 
				    v_estado := PEX;
					 
				when PEX =>
				    v_estado := ESPE;
				
				when ESPE =>
				    if (esta_L2_lista(L2_lista)) then
					     v_estado := PBL;
					 end if;
					  
				when PBL =>
				    v_estado := ESPL;
				
				when ESPL =>
				    if (hay_respuesta_L2(resp_L2)) then
					     v_estado := ESB;
					 end if;
				
				when ESB =>
				    if (es_fallo_lectura(pet, derechos_acceso)) then 
					     v_estado := LEC;
					 elsif (es_fallo_escritura(pet, derechos_acceso)) then 
					     v_estado := ESC;
					 end if;
				    
				when ESC =>
				    v_estado := DES;
				
				when LEC =>
				    v_estado := DES;
	
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, pet, info_estado, estado, resp_L2, derechos_acceso, expulsion_modificado, L2_lista, expulsion_lectura)
variable v_s_control: tp_contro_cam_cntl;
variable v_resp: tp_contro_s;
variable v_pet_L2: tp_cntl_L2_s;

begin

   por_defecto(v_s_control, v_pet_L2, v_resp);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DES0 => 
				    if (hay_peticion_procesador(pet)) then 
					     if (hay_peticion_ini_procesador(pet)) then 
						      enviar_inicio_L2(v_pet_L2);
						  else 
					         lectura_etiq_estado(v_s_control);
						  end if;
					 end if;
					 
				when INI =>
				    actualizar_etiqueta(v_s_control);
					 actualizar_estado(v_s_control, contenedor_M);
					 actualizar_dato(v_s_control);
					 interfaces_en_CURSO(v_resp);
				
				when ESCINI =>
				    interfaces_HECHOE(v_resp);
				
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
					       lectura_etiq_estado(v_s_control);
						 end if;
					 end if;
					 
				when CMPET =>
				    if (es_acierto_lectura(pet, derechos_acceso)) then 
					     lectura_datos(v_s_control);
					 elsif (es_acierto_escritura(pet, derechos_acceso)) then
					     if (info_estado.EST = contenedor_L) then
						      actualizar_estado(v_s_control, contenedor_M); 
						  end if;
					     actualizar_dato_palabra(v_s_control);
					 elsif (es_fallo(derechos_acceso)) then
					     if (es_expulsion_bl_modificado(expulsion_modificado)) then 
						      lectura_datos(v_s_control);
						  elsif (es_expulsion_bl_lectura(expulsion_lectura)) then 
						  else
					         enviar_pet_Pt(v_pet_L2);
						  end if;
					 end if;
					 interfaces_en_CURSO(v_resp);
				
				when LVIC => 
				    if (es_expulsion_bl_lectura(expulsion_lectura)) then 
					     enviar_pet_PtXl(v_pet_L2);
					 elsif (es_expulsion_bl_modificado(expulsion_modificado)) then
					     enviar_pet_PtX(v_pet_L2);
					 end if; 
				    expulsar_bloque_modificado(v_s_control);
					 interfaces_en_CURSO(v_resp);
				
				when PEX =>
				    interfaces_en_CURSO(v_resp);
					 
				when ESPE =>
				    if (esta_L2_lista(L2_lista)) then 
					     enviar_pet_Pt(v_pet_L2);
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when PBL => 
				    interfaces_en_CURSO(v_resp);
					 
				when ESPL =>
				    if (hay_respuesta_L2(resp_L2)) then 
					     actualizar_etiqueta(v_s_control);
						  actu_datos_desde_bus(v_s_control);
						  actualizar_dato(v_s_control);
					     if (es_fallo_lectura(pet, derechos_acceso)) then
						      actualizar_estado(v_s_control, contenedor_L);
						  elsif (es_fallo_escritura(pet, derechos_acceso)) then 
						      actualizar_estado(v_s_control, contenedor_M);
						  end if;
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESB => 
				    if (es_lectura(pet)) then 
					     lectura_datos(v_s_control);
					 elsif (es_escritura(pet)) then 
					     actualizar_dato_palabra(v_s_control);
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESC =>
				     interfaces_HECHOE(v_resp);
					  
				when LEC => 
				     interfaces_HECHOL(v_resp);
		 end case;
						    
   end if;
	
   s_control <= v_s_control after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
	pet_L2 <= v_pet_L2 after retardo_logica_salida;
	
end process;

end;