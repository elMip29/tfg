library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxD is      
 port(palabra_0: in st_palabra_dat;
      palabra_1: in st_palabra_dat;
		sel: in std_logic;
		salida: out st_palabra_dat);
end muxD;

architecture compor of muxD is  

begin
 
  salida <= palabra_0 when (sel = '0') else palabra_1;
	  
end compor;