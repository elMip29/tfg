library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.retardos_pkg.all;

entity RegDatos_pet is							
  port (reloj: in std_logic;
        pcero: in std_logic;		
        entrada: in tp_peticion_datos;
        salida: out tp_peticion_datos);
end RegDatos_pet;

architecture comportamiento of RegDatos_pet is
begin
 process (reloj, pcero) 
   begin
	  if pcero = '1' then 
		salida <= (dir => (others => '0'), dato_escribir => (others => '0')) after retREGDES;
	  elsif rising_edge(reloj) then
		salida <= entrada after retREGDES;
	  end if;
 end process;
end;