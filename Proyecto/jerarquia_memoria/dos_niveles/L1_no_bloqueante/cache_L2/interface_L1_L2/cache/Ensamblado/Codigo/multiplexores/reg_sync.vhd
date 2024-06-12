library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_sync is 
  port(reloj: in std_logic;
       entrada: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of reg_sync is 

begin 
process(reloj) is
begin
   if (rising_edge(reloj)) then 
	    if (entrada = '1') then 
		     salida <= '1' after retREGDES;
		 else 
		     salida <= '0';
		 end if;
	end if;
end process;

end comportamiento;