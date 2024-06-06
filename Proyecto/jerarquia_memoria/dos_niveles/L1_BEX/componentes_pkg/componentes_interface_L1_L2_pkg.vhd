library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

package componentes_interface_L1_L2_pkg is

component registro_pet_L2 is
  port(reloj: in std_logic; 
       pe: in std_logic;
	    e: in tp_peticion_L2;
	    s: out tp_peticion_L2);
end component;

component mux_pet_L2 
  port(a: in tp_peticion_L2;
       b: in tp_peticion_L2;
	    sel: in std_logic;
	    s: out tp_peticion_L2);
end component;


end package componentes_interface_L1_L2_pkg;

