library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity registro_pet_L2 is   
port (reloj: in std_logic; 
      pe: in std_logic;
	   e: in tp_peticion_L2;
	   s: out tp_peticion_L2);
end registro_pet_L2;

architecture compor of registro_pet_L2 is  
begin

process(reloj)
begin
	if (rising_edge(reloj)) then
		if pe = '1' then
			s <= e after ret_reg_pet;
		end if;
	end if;
end process;
end compor;


