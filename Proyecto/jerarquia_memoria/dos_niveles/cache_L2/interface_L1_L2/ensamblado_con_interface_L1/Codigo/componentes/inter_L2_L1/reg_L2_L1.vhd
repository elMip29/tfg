library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;
use work.inter_L2_L1_pkg.all;

entity reg_L2_L1 is   
port (reloj: in std_logic;
      entrada: in tp_respuesta_L2; 
      pe: in std_logic;
	   salida: out tp_respuesta_L2);
end reg_L2_L1;

architecture comportamiento of reg_L2_L1 is  
begin
salida <= entrada;
--process(reloj)
--begin
--	if (rising_edge(reloj)) then
--		if (pe = '1') then
--			 salida <= entrada after ret_reg_pet;
--		end if;
--	end if;
--end process;

end comportamiento;
