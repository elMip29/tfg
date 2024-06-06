library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

package inter_L2_L1_pkg is 

component reg_L2_L1 is   
  port (reloj: in std_logic;
        entrada: in tp_respuesta_L2; 
        pe: in std_logic;
	     salida: out tp_respuesta_L2);
end component;

end inter_L2_L1_pkg;