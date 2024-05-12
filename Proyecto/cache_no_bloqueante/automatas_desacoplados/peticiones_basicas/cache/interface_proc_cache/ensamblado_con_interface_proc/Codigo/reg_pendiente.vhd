library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_pendiente is   
port (reloj: in std_logic; 
      pe: in std_logic;
	   e: in std_logic;
	   s: out std_logic);
end reg_pendiente;

architecture compor of reg_pendiente is  
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
