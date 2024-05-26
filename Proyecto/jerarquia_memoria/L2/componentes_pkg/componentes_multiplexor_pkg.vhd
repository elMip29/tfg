library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;

package componentes_multiplexor_pkg is

component muxB is 
  port(bloque_memoria: in st_bloque_dat;
       bloque_L1: in st_bloque_dat;
		 sel: in std_logic;
		 salida: out st_bloque_dat);
end component;

component muxE is 
  port(dir_bloque_proc: in st_dir_bloque;
       dir_bloque_exp: in st_dir_bloque;
		 sel: in std_logic;
		 salida: out st_dir_bloque);
end component;

component muxD is 
  port(palabra_0: in st_palabra_dat;
       palabra_1: in st_palabra_dat;
		 sel: in std_logic;
		 salida: out st_palabra_dat);
end component;

end package componentes_multiplexor_pkg;