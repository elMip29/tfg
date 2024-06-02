library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity mux_pet_L2 is      
port (a: in tp_peticion_L2;
      b: in tp_peticion_L2;
	   sel: in std_logic;
	   s: out tp_peticion_L2);
end mux_pet_L2;

architecture compor of mux_pet_L2 is  

begin
 
  s <= a after ret_mux_pet when (sel = '0') else b after ret_mux_pet;
	  
end compor;




