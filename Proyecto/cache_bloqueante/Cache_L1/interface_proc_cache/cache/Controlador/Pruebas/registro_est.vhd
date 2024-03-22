library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;
use work.retardos_pkg.all;

entity registro_est is							
  port (reloj: in std_logic;	
        pe: in std_logic;
        e: in tp_contro_cam_estado;
        s: out tp_contro_cam_estado);
end registro_est;

architecture comportamiento of registro_est is
begin
 process (reloj) 
   begin
	  if rising_edge(reloj) then
		s <= e after retREGDES;
	  end if;
 end process;
end;