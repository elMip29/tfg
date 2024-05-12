library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_LE is 
  port(reloj: in std_logic; 
       entrada: in std_logic;
		 pe: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of reg_LE is 

begin 

process(reloj) 
 begin 
    if (rising_edge(reloj)) then 
	     if (pe = '1') then
		      salida <= entrada after retREGDES;
		  end if; 
	 end if;
end process;

end comportamiento;