library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity reg_validez_bdf is 
  port(reloj: in std_logic; 
       pcero: in std_logic;
		 entrada: in std_logic;
		 pe_val: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of reg_validez_bdf is 

begin 

process(reloj, pcero)
  begin 
     if (pcero = '1') then 
	      salida <= '0';
	  elsif (rising_edge(reloj)) then 
	         if (pe_val = '1') then 
				    salida <= entrada;
            end if;
	  end if;
end process;

end comportamiento;