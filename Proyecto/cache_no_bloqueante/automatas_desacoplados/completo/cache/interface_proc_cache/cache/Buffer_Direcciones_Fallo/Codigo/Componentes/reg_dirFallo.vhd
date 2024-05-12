library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity reg_dirFallo is 
  port(reloj: in std_logic;
       entrada: in st_dir;
	    pe: in std_logic;
	    salida: out st_dir);
end entity;

architecture comportamiento of reg_dirFallo is 

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