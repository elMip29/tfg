library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity registro_L2_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 entrada: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of registro_L2_lista is 

begin

process(reloj, pcero)
begin 
   if (pcero = '1') then 
	    salida <= '0';
	elsif (rising_edge(reloj)) then 
	    salida <= entrada after retREGDES;
	end if;
end process;

end comportamiento;