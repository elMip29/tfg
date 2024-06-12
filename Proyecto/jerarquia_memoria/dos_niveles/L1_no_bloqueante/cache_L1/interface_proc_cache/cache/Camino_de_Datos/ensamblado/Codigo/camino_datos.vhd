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
		 camino_s: out tp_camino_s);
end entity;

architecture estructural of camino_datos is

signal ET_e_inter: tp_etiq_e;
signal ET_salida: st_etiqueta;
signal AF_inter: std_logic;
signal mismo_cont_L2_inter: std_logic;

signal EST_e_inter: tp_est_e;
signal EST_salida: st_estado;

signal DAT_e_inter: tp_datos_e;
signal DAT_salida: st_bloque_dat;

signal dato_a_escribir: st_bloque_dat;
signal palabra_0: st_palabra_dat;
signal palabra_1: st_palabra_dat;
signal palabra_seleccionada: st_palabra_dat;
signal DAT_pe: st_bloque_esc;

signal dirReconstruida: st_dir_bloque;

signal camino_s_inter: tp_camino_s;

begin 

dirReconstruida <= ET_salida & camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj);

palabra_0 <= DAT_salida(7 downto 0);
palabra_1 <= DAT_salida(15 downto 8);

-- Campo Etiquetas --
etiquetas: ensamblado_etiquetas port map(reloj => reloj, etiq_entrada => ET_e_inter, DL => ET_salida, AF => AF_inter, mismo_cont_L2 => mismo_cont_L2_inter);

-- Campo Estado --
estado: memoria_EST port map(reloj => reloj, EST_e => EST_e_inter, DL => EST_salida);

-- Campo Datos --
datos: ensamblado_datos port map(reloj => reloj, datos_e => DAT_e_inter, DL => DAT_salida);

-- Multiplexor (dato memoria, dato procesador)
mux_B: muxB port map(bloque_memoria => camino_e.dat_L2, dato_procesador => camino_e.dat_proc, sel => camino_e.muxB, salida => dato_a_escribir);

-- Multiplexor (palabra 0, palabra 1)
mux_D: muxD port map(palabra_0 => palabra_0, palabra_1 => palabra_1, sel => camino_e.muxD, salida => palabra_seleccionada);

-- Circuiteria para el permiso de escritura del campo datos
esc_DAT: permiso_escritura_DAT port map(byte => camino_e.muxD, esc_pala => camino_e.DAT_palabra_esc, esc_bloque => camino_e.DAT_bloque_esc, pe => DAT_pe);

-- entrada campo etiquetas --
ET_e_inter <= (acc => camino_e.etiq_acc,
               dirB => camino_e.dirB,
					esc => camino_e.etiq_esc);
					
-- entrada campo estado --
EST_e_inter <= (acc => camino_e.est_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
                esc => camino_e.est_esc,
					 esc_ocupado => camino_e.est_esc_ocupado,
			       DE => camino_e.est_DE);
					 
-- entrada campo datos --
DAT_e_inter <= (acc => camino_e.dat_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
					 esc => DAT_pe,
					 DE => dato_a_escribir);

-- salida camino datos --
camino_s <= (palabra => palabra_seleccionada,
             camp_DL => DAT_salida,
             camp_AF => AF_inter, 
				 camp_EST => EST_salida, 
				 dir_EXP => dirReconstruida,
				 mismo_cont_L2 => mismo_cont_L2_inter);

end estructural;
