library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_bdf_pkg is 

component reg_LE is 
  port(reloj: in std_logic; 
       entrada: in std_logic;
		 pe: in std_logic;
		 salida: out std_logic);
end component;

component reg_dirFallo is 
  port(reloj: in std_logic;
       entrada: in st_dir;
	    pe: in std_logic;
	    salida: out st_dir);
end component;

component reg_dato_esc is 
  port(reloj: in std_logic;
       entrada: in st_palabra_dat;
		 pe: in std_logic;
		 salida: out st_palabra_dat);
end component;

component reg_validez_bdf is 
  port(reloj: in std_logic; 
       pcero: in std_logic;
		 entrada: in std_logic;
		 pe_val: in std_logic;
		 salida: out std_logic);
end component;

end componentes_bdf_pkg;