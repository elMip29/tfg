library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;
use work.retardos_pkg.all;

entity registro_pet is							
  port (reloj: in std_logic;	
        pe: in std_logic;
        e: in tp_contro_e;
        s: out tp_contro_e);
end registro_pet;

architecture comportamiento of registro_pet is
begin
 process (reloj) 
   begin
	  if rising_edge(reloj) then
		s <= e after retREGDES;
	  end if;
 end process;
end;
