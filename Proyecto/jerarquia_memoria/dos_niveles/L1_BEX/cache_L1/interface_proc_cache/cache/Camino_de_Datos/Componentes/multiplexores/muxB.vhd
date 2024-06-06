library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxB is      
 port(bloque_memoria: in st_bloque_dat;
      dato_procesador: in st_bloque_dat;
		sel: in std_logic;
		salida: out st_bloque_dat);
end muxB;

architecture compor of muxB is  

begin
 
  salida <= dato_procesador when (sel = '0') else bloque_memoria;
	  
end compor;
