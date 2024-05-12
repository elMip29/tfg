library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity permiso_escritura_DAT is 
  port(byte: in std_logic;
       esc_pala: in std_logic;
	    esc_bloque: in std_logic;
	    pe: out st_bloque_esc);
end entity;

architecture comportamiento of permiso_escritura_DAT is 

signal esc_pala_0: std_logic;
signal esc_pala_1: std_logic;

begin
    
esc_pala_0 <= (not byte and esc_pala) or esc_bloque;
esc_pala_1 <= (byte and esc_pala) or esc_bloque;

pe(0) <= esc_pala_0;
pe(1) <= esc_pala_1;

end comportamiento; 