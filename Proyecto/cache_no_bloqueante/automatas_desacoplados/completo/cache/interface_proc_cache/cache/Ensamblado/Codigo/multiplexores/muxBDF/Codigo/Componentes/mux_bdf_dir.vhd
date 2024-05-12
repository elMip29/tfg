library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity mux_bdf_dir is 
   port(entrada_proc: in st_dir; 
	     entrada_bdf: in st_dir; 
		  sel: in std_logic; 
		  salida: out st_dir);
end entity;

architecture comportamiento of mux_bdf_dir is 

begin 

salida <= entrada_proc when (sel = '0') else entrada_bdf;

end comportamiento;