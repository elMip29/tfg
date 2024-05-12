library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity RegControl_pet is							
 port (reloj: in std_logic;
       pcero: in std_logic;		
	   entrada: in tp_peticion_control;
	   salida: out tp_peticion_control);
end RegControl_pet;

architecture comportamiento of RegControl_pet is
begin
  process (reloj, pcero)
    begin
	  if pcero = '1' then 
		salida <= (m_pet => '0', m_pe => '0') after retREGDES;
	  elsif rising_edge(reloj) then
		salida <= entrada after retREGDES;
	  end if;
  end process;
end;

