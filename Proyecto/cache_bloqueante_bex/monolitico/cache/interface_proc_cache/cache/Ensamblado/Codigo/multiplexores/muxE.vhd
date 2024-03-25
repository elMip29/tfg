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

begin
  
  process(sel_CMPET, sel_ESC_LEC, dir_bloque_proc, dir_bloque_exp) 
    begin
	    if (sel_CMPET = '1') then 
		     salida <= dir_bloque_proc;
		 elsif (sel_ESC_LEC = '1') then 
		     salida <= dir_bloque_exp;
	    end if;
  end process;
	  
end compor;