library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;
use work.componentes_camino_pkg.all;
use work.componentes_multiplexor_pkg.all;

entity camino_datos is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e;
		 camino_e_acierto: in tp_camino_e_acierto;
		 camino_e_fallo: in tp_camino_e_fallo;
		 camino_s: out tp_camino_s);
end entity;

architecture estructura of camino_datos is

signal ET_e_inter: tp_etiq_e;
signal ET_e_inter_fallo: tp_etiq_e;
signal ET_salida: st_etiqueta;
signal AF_inter: std_logic;
signal ET_e_seleccionado: tp_etiq_e;

signal EST_e_inter: tp_est_e;
signal EST_salida: st_estado;
signal EST_e_inter_fallo: tp_est_e;
signal EST_e_seleccionado: tp_est_e;

signal DAT_e_inter: tp_datos_e;
signal DAT_e_inter_fallo: tp_datos_e;
signal DAT_salida: st_bloque_dat;
signal DAT_e_seleccionado: tp_datos_e;


signal dato_a_escribir: st_bloque_dat;
signal palabra_0: st_palabra_dat;
signal palabra_1: st_palabra_dat;
signal palabra_seleccionada: st_palabra_dat;
signal DAT_pe: st_bloque_esc;

signal dirReconstruida: st_dir_bloque;

signal camino_s_inter: tp_camino_s;

signal controlMux: std_logic; -- Senyal de control para los multiplexores de los campos ET, EST, DAT 
signal controlMuxB: std_logic; -- Senyal de control para el multiplexor MuxB 

begin 

dirReconstruida <= ET_salida & camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj);

palabra_0 <= DAT_salida(7 downto 0);
palabra_1 <= DAT_salida(15 downto 8);

controlMux <= camino_e_acierto.muxCamino or camino_e_fallo.muxCamino; -- Por defecto se escogeran los datos provenientes del acceso que da acierto
controlMuxB <= camino_e_fallo.muxB or camino_e_acierto.muxB; -- Por defecto se escogera el dato que llega del procesador

-- Campo Etiquetas --
etiquetas: ensamblado_etiquetas port map(reloj => reloj, etiq_entrada => ET_e_seleccionado, DL => ET_salida, AF => AF_inter);

-- Campo Estado --
estado: memoria_EST port map(reloj => reloj, EST_e => EST_e_seleccionado, DL => EST_salida);

-- Campo Datos --
datos: ensamblado_datos port map(reloj => reloj, datos_e => DAT_e_seleccionado, DL => DAT_salida);

-- Multiplexor (dato memoria, dato procesador)
mux_B: muxB port map(bloque_memoria => camino_e.dat_mem, dato_procesador => camino_e.dat_proc, sel => controlMuxB, salida => dato_a_escribir);

-- Multiplexor (palabra 0, palabra 1)
mux_D: muxD port map(palabra_0 => palabra_0, palabra_1 => palabra_1, sel => camino_e.muxD, salida => palabra_seleccionada);

-- Circuiteria para el permiso de escritura del campo datos
esc_DAT: permiso_escritura_DAT port map(byte => camino_e.muxD, esc_pala => camino_e.DAT_palabra_esc, esc_bloque => camino_e.DAT_bloque_esc, pe => DAT_pe);

-- entrada campo etiquetas, controlador camino acierto --
ET_e_inter <= (acc => camino_e_acierto.etiq_acc, 
               dirB => camino_e.dirB,
					esc => camino_e_acierto.etiq_esc);

-- entrada campo etiquetas, controlador camino fallo --
ET_e_inter_fallo <= (acc => camino_e_fallo.etiq_acc, 
                     dirB => camino_e.dirB, 
							esc => camino_e_fallo.etiq_esc);
							
-- Multiplexor para la seleccion entrada campo etiquetas --
mux_ET: muxET port map(ET_e => ET_e_inter, ET_e_fallo => ET_e_inter_fallo, sel => controlMux, ET_salida => ET_e_seleccionado);
					
-- entrada campo estado, controlador camino acierto --
EST_e_inter <= (acc => camino_e_acierto.est_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
                esc => camino_e_acierto.est_esc,
			       DE => camino_e_acierto.est_DE);
					 
-- entrada campo estado, controlador camino fallo --
EST_e_inter_fallo <= (acc => camino_e_fallo.est_acc, 
                      dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
							 esc => camino_e_fallo.est_esc, 
							 DE => camino_e_fallo.est_DE);

-- Multiplexor para la seleccion entrada campo estado --
mux_EST: muxEST port map(EST_e => EST_e_inter, EST_e_fallo => EST_e_inter_fallo, sel => controlMux, EST_salida => EST_e_seleccionado);
					 
-- entrada campo datos, controlador camino acierto --
DAT_e_inter <= (acc => camino_e_acierto.dat_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
					 esc => DAT_pe,
					 DE => dato_a_escribir);
					 
-- entrada campo datos, controlador camino fallo --
DAT_e_inter_fallo <= (acc => camino_e_fallo.dat_acc,
                      dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
							 esc => DAT_pe, 
							 DE => dato_a_escribir); 

-- Multiplexor para la seleccion entrada campo datos --
mux_DAT: muxDAT port map(DAT_e => DAT_e_inter, DAT_e_fallo => DAT_e_inter_fallo, sel => controlMux, DAT_salida => DAT_e_seleccionado);

-- salida camino datos --
camino_s <= (palabra => palabra_seleccionada,
             camp_DL => DAT_salida,
             camp_AF => AF_inter, 
				 camp_EST => EST_salida, 
				 dir_EXP => dirReconstruida);

end;
