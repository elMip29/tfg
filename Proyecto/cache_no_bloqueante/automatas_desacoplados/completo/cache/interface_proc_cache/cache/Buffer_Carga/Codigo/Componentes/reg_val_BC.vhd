library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_val_BC is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 entrada: in std_logic;
		 pe_val: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of reg_val_BC is 

begin 

process(reloj, pcero)
  begin 
     if (pcero = '1') then 
	      salida <= '0' after retREGDES;
	  elsif (rising_edge(reloj)) then 
	         if (pe_val = '1') then 
				    salida <= entrada after retREGDES; 
				end if;
	  end if;
end process;

end comportamiento;