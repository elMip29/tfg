library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;

package componentes_interface_proc_cache_pkg is

component registro_pet is
  port(reloj: in std_logic; 
       pe: in std_logic;
	    e: in tp_peticion;
	    s: out tp_peticion);
end component;

component mux_pet 
  port(a: in tp_peticion;
       b: in tp_peticion;
	    sel: in std_logic;
	    s: out tp_peticion);
end component;


end package componentes_interface_proc_cache_pkg;

