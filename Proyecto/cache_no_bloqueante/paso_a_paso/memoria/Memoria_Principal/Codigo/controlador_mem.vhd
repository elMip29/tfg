library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity controlador_mem is
   port(m_pet_val: in std_logic;
		  m_pe: in std_logic;
		  LE: out std_logic; -- Senyal que indica que tipo de acceso a memoria es (L,1) o (E,0) para validar el BC
	     m_resp_val: out std_logic);
end controlador_mem;

architecture comportamiento of controlador_mem is

begin 

LE <= (not m_pe) and m_pet_val;

m_resp_val <= m_pet_val after retcnt_mem;

end; 