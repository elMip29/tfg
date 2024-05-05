library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity reg_bloq_mem is 
  port(reloj: in std_logic; 
       entrada: in st_bloque_dat; 
		 pe: in std_logic;
		 salida: out st_bloque_dat);
end entity;

architecture comportamiento of reg_bloq_mem is 

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