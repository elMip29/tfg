library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

entity camino_datos is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e;
		 camino_s: out tp_camino_s);
end entity;

architecture estructura of camino_datos is

component ensamblado_etiquetas is 
  port(reloj: in std_logic; 
	    etiq_entrada: in tp_etiq_e;
		DL: out st_etiqueta;
		AF: out std_logic);
end component;

component memoria_EST is 
  port(reloj: in std_logic;
	   EST_e: in tp_est_e;
	   DL: out st_estado);
end component;

component ensamblado_datos is 
  port(reloj: in std_logic;
	   datos_e: in tp_datos_e;
	   DL: out st_bloque_dat);
end component;

signal ET_e_inter: tp_etiq_e;
signal ET_salida: st_etiqueta;
signal AF_inter: std_logic;

signal EST_e_inter: tp_est_e;
signal EST_salida: st_estado;

signal DAT_e_inter: tp_datos_e;
signal DAT_salida: st_bloque_dat;

signal camino_s_inter: tp_camino_s;

begin 

etiquetas: ensamblado_etiquetas port map(reloj => reloj, etiq_entrada => ET_e_inter, DL => ET_salida, AF => AF_inter);

estado: memoria_EST port map(reloj => reloj, EST_e => EST_e_inter, DL => EST_salida);

datos: ensamblado_datos port map(reloj => reloj, datos_e => DAT_e_inter, DL => DAT_salida);

-- entrada campo etiquetas --
ET_e_inter <= (acc => camino_e.etiq_acc,
               dirB => camino_e.dirB,
					esc => camino_e.etiq_esc);
					
-- entrada campo estado --
EST_e_inter <= (acc => camino_e.est_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
                esc => camino_e.est_esc,
			       DE => camino_e.est_DE);
					 
-- entrada campo datos --
DAT_e_inter <= (acc => camino_e.dat_acc,
                dir => camino_e.dirB(bitMAS_cj - 1 downto bitMEN_cj),
					 esc => camino_e.dat_esc,
					 DE => camino_e.dat_DE);

-- salida camino datos --
camino_s <= (camp_DL => DAT_salida,
             camp_AF => AF_inter, 
				 camp_EST => EST_salida, 
				 camp_ET => ET_salida);

end;
       
