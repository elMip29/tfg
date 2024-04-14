library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity RegDatos_resp is							
  port (reloj: in std_logic;
        pcero: in std_logic;
        entrada: in tp_respuesta_datos;
        salida: out tp_respuesta_datos);
end RegDatos_resp;

architecture comportamiento of RegDatos_resp is
begin
 process (reloj, pcero) 
   begin
	   if pcero = '1' then 
		 salida <= (m_dato => (others => '0')) after retREGDES;
	   elsif rising_edge(reloj) then
		 salida <= entrada after retREGDES;
	   end if;
 end process;
end;

