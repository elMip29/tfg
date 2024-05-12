library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_identificador is 
  port(reloj: in std_logic; 
       entrada: in integer;
		 pe: in std_logic;
		 salida: out integer);
end entity;

architecture comportamiento of reg_identificador is 

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