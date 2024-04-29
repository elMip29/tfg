library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity regAsociadoBC is 
   port(reloj: in std_logic;
        pcero: in std_logic;
		  entrada: in std_logic;
		  pe: in std_logic;
		  salida: out std_logic);
end entity;

architecture comportamiento of regAsociadoBC is 

begin 

process(reloj, pcero)
begin 
   if (pcero = '1') then 
	    salida <= '0' after retREGDES;
	elsif (rising_edge(reloj)) then 
	       if (pe = '1') then 
			     salida <= entrada after retREGDES;
			 end if;
	end if;
end process;

end comportamiento;