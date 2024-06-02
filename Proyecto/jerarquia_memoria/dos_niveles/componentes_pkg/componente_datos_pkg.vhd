library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;

package componente_datos_pkg is

component memoria_DAT is 
  port(reloj: in std_logic;
	    DAT_e: in tp_mem_dat_e;
		 DL: out st_bloque_dat);
end component;

component memoria_DAT_L2 is 
  port(reloj: in std_logic;
	    DAT_e: in tp_mem_dat_e_L2;
		 DL: out st_bloque_dat);
end component;

end package componente_datos_pkg;