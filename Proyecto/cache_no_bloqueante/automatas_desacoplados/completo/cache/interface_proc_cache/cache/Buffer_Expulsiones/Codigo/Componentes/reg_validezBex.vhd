library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity reg_validezBex is 
   port(reloj: in std_logic;
        pcero: in std_logic;	
	     pe_val: in std_logic;
	     bit_validez: in std_logic;
		  validez_bex: out std_logic);
end entity;

architecture comportamiento of reg_validezBex is 

begin 

process(reloj, pcero)
  begin 
     if (pcero = '1') then 
	      validez_bex <= '0' after retREGDES;
     elsif (rising_edge(reloj)) then 
	         if (pe_val = '1') then 
	            validez_bex <= bit_validez after retREGDES;
			end if;
	  end if;
end process;

end comportamiento;