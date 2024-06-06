library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxE_L2 is      
 port(dir_bloque_L1: in st_dir_bloque;
      dir_bloque_exp: in st_dir_bloque;
		sel: in std_logic;
		salida: out st_dir_bloque);
end muxE_l2;

architecture compor of muxE_L2 is  

begin
 
  salida <= dir_bloque_L1 when (sel = '0') else dir_bloque_exp;
	  
end compor;