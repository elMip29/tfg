library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxE is      
 port(dir_bloque_proc: in st_dir_bloque;
      dir_bloque_exp: in st_dir_bloque;
		sel: in std_logic;
		salida: out st_dir_bloque);
end muxE;

architecture compor of muxE is  

begin
 
  salida <= dir_bloque_proc when (sel = '0') else dir_bloque_exp;
	  
end compor;