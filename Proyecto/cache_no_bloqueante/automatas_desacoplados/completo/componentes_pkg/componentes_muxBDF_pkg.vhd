library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_muxBDF_pkg is 

component mux_bdf_dir is 
   port(entrada_proc: in st_dir; 
	     entrada_bdf: in st_dir; 
		  sel: in std_logic; 
		  salida: out st_dir);
end component;

component mux_bdf_dat is 
   port(entrada_proc: in st_palabra_dat; 
	     entrada_bdf: in st_palabra_dat; 
		  sel: in std_logic; 
		  salida: out st_palabra_dat);
end component;

end componentes_muxBDF_pkg;