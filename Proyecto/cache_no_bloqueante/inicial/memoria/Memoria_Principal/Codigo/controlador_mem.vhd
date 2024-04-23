library ieee;
use ieee.std_logic_1164.all;

use work.retardos_pkg.all;

entity controlador_mem is
   port(m_pet_val: in std_logic;
	     m_pe: in std_logic;
		  lec: out std_logic; -- Senyal que indica si la operacion que finaliza es una LEC(1) o una ESC(0)
	     m_resp_val: out std_logic);
end controlador_mem;

architecture comportamiento of controlador_mem is

begin 

lec <= (not m_pe) and m_pet_val after retcnt_mem;

m_resp_val <= m_pet_val after retcnt_mem;

end; 