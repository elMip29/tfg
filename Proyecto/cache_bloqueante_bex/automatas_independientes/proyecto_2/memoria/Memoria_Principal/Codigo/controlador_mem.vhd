library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity controlador_mem is
   port(m_pet_val: in std_logic;
	     m_resp_val: out std_logic);
end controlador_mem;

architecture comportamiento of controlador_mem is

begin 

m_resp_val <= m_pet_val after retcnt_mem;

end; 