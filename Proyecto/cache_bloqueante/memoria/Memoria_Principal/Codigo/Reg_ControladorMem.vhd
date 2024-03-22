library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity Reg_ControladorMem is				
  port (reloj: in std_logic;	
        entrada: in std_logic;
        salida: out std_logic);
end;

architecture comportamiento of Reg_ControladorMem is
  begin
     process (reloj) begin
       if rising_edge(reloj) then
              salida <= entrada after retREGDES;
       end if;
     end process;
end;

