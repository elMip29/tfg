library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;
use work.componentes_camino_pkg.all;
use work.componentes_multiplexor_pkg.all;

entity camino_datos_L2 is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e_L2;
		 camino_s: out tp_camino_s_L2);
end entity;

architecture estructura of camino_datos_L2 is

signal ET_e_inter: tp_etiq_e;
signal ET_salida: st_etiqueta_L2;
signal AF_inter: std_logic;

signal EST_e_inter: tp_est_e_L2;
signal EST_salida: st_estado_L2;

signal DAT_e_inter: tp_datos_e_L2;
signal DAT_salida: st_bloque_dat;

signal dato_a_escribir: st_bloque_dat;
signal dirReconstruida: st_dir_bloque;

signal camino_s_inter: tp_camino_s_L2;

begin 

dirReconstruida <= ET_salida & camino_e.dirB(bitMAS_cj_L2 - 1 downto bitMEN_cj_L2);

-- Campo Etiquetas --
etiquetas: ensamblado_etiquetas_L2 port map(reloj => reloj, etiq_entrada => ET_e_inter, DL => ET_salida, AF => AF_inter);

-- Campos Estados --
estado: memoria_EST_L2 port map(reloj => reloj, EST_e => EST_e_inter, DL => EST_salida);

-- Campo Datos --
datos: ensamblado_datos_L2 port map(reloj => reloj, datos_e => DAT_e_inter, DL => DAT_salida);

-- Multiplexor (bloque de memoria, bloque de cache L1)
mux_B: muxB_L2 port map(bloque_memoria => camino_e.dat_mem, bloque_L1 => camino_e.dat_L1, sel => camino_e.muxB, salida => dato_a_escribir);

-- entrada campo etiquetas --
ET_e_inter <= (acc => camino_e.etiq_acc,
               dirB => camino_e.dirB,
					esc => camino_e.etiq_esc);
					
-- entrada campo estado --
EST_e_inter <= (acc => camino_e.est_acc,
                dir => camino_e.dirB(bitMAS_cj_L2 - 1 downto bitMEN_cj_L2),
                esc => camino_e.est_esc,
			       DE => camino_e.est_DE);
					 
-- entrada campo datos --
DAT_e_inter <= (acc => camino_e.dat_acc,
                dir => camino_e.dirB(bitMAS_cj_L2 - 1 downto bitMEN_cj_L2),
					 esc => camino_e.dat_esc,
					 DE => dato_a_escribir);

-- salida camino datos --
camino_s <= (camp_DL => DAT_salida,
             camp_AF => AF_inter, 
				 camp_EST => EST_salida, 
				 dir_EXP => dirReconstruida);

end estructura;
