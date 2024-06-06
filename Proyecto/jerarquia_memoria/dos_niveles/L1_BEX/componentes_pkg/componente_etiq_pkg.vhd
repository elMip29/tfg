library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;

package componente_etiq_pkg is

component memoria_ET is 
  port(reloj: in std_logic;
	    ET_e: in tp_memoria_et_e;
		 DL: out st_etiqueta);
end component;

component memoria_ET_L2 is 
  port(reloj: in std_logic;
	    ET_e: in tp_memoria_et_e_L2;
		 DL: out st_etiqueta_L2);
end component;

end package componente_etiq_pkg;