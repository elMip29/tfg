library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxE is      
 port(dir_bloque_proc: in st_dir_bloque;
      dir_bloque_exp: in st_dir_bloque;
		sel_CMPET: in std_logic;
		sel_ESC_LEC: in std_logic;
		salida: out st_dir_bloque);
end muxE;

architecture compor of muxE is  

signal sv_CMPET: st_dir_bloque;
signal sv_ESC_LEC: st_dir_bloque;

signal and_CMPET: st_dir_bloque;
signal and_ESC_LEC: st_dir_bloque;

begin

sv_CMPET <= (others => sel_CMPET);
sv_ESC_LEC <= (others => sel_ESC_LEC);

and_CMPET <= dir_bloque_proc and sv_CMPET;
and_ESC_LEC <= dir_bloque_exp and sv_ESC_LEC;

salida <= and_CMPET or and_ESC_LEC;
	  
end compor;