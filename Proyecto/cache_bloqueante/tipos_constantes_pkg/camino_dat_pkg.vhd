library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package camino_dat_pkg is

type tp_camino_e is record
	etiq_acc: std_logic;
	dirB: st_dir_bloque;
   etiq_esc : std_logic;
   est_acc: std_logic;
   est_esc: std_logic;
   est_DE: st_estado;
   dat_acc: std_logic;
   dat_esc: st_bloque_esc;
   dat_DE: st_bloque_dat;
end record;

type tp_camino_s is record
	camp_DL: st_bloque_dat;
   camp_AF: std_logic;
   camp_EST: st_estado;
	camp_ET: st_etiqueta; 
end record;

end package camino_dat_pkg;


