library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;
use work.componente_datos_pkg.all;

entity ensamblado_datos_L2 is 
  port(reloj: in std_logic;
       datos_e: in tp_datos_e_L2;
		 DL: out st_bloque_dat);
end entity; 

architecture estructura of ensamblado_datos_L2 is

signal DAT_e_inter: tp_mem_dat_e_L2;
signal DL_inter: st_bloque_dat;

begin 

memoria_datos: memoria_DAT_L2 port map(reloj => reloj, DAT_e => DAT_e_inter, DL => DL_inter);

-- señales de entrada --
DAT_e_inter <= (acc => datos_e.acc,
                dir => datos_e.dir,
					 esc => datos_e.esc,
					 DE => datos_e.DE);
					 
-- Dato leido --
DL <= DL_inter;

end estructura;