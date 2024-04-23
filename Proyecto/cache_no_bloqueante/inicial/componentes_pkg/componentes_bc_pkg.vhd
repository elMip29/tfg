library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_bc_pkg is 

component reg_bloq_mem is 
  port(reloj: in std_logic; 
       entrada: in st_bloque_dat; 
		 salida: out st_bloque_dat);
end component;

component reg_val_BC is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 entrada: in std_logic;
		 pe_val: in std_logic;
		 salida: out std_logic);
end component;

end componentes_bc_pkg;