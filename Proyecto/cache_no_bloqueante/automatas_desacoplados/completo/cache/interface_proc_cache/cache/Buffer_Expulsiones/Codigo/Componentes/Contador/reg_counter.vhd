library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity reg_counter is 
   port(reloj: in std_logic;
	     pcero: in std_logic;
	     entrada: in tam_contador_bex;
		  salida: out tam_contador_bex);
end entity;

architecture comportamiento of reg_counter is 

begin 

process(reloj, pcero)
begin 
   if (pcero = '1') then 
	    salida <= (others => '0') after retREGDES;
	elsif (rising_edge(reloj)) then
          salida <= entrada after retREGDES; 
	end if;
end process;

end comportamiento;