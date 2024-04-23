library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity RegControl_resp is							
 port (reloj: in std_logic;
       pcero: in std_logic;		
	   entrada: in tp_respuesta_control;
	   salida: out tp_respuesta_control);
end RegControl_resp;

architecture comportamiento of RegControl_resp is
begin
  process (reloj, pcero) 
    begin
	    if pcero = '1' then 
		  salida <= (m_val => '0',
		             lec => '0') after retREGDES;
	    elsif rising_edge(reloj) then
		  salida <= entrada after retREGDES;
	    end if;
  end process;
end;

