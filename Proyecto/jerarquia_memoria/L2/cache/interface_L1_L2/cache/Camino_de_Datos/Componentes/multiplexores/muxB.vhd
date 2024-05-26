library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxB is      
 port(bloque_memoria: in st_bloque_dat;
      bloque_L1: in st_bloque_dat;
		sel: in std_logic;
		salida: out st_bloque_dat);
end muxB;

architecture compor of muxB is  

begin
 
  salida <= bloque_L1 when (sel = '0') else bloque_memoria;
	  
end compor;
