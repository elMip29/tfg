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
   DAT_palabra_esc: std_logic;
   DAT_bloque_esc: std_logic;
   dat_mem: st_bloque_dat;
   dat_proc: st_bloque_dat;
   muxB: std_logic; -- señal control de muxB
   muxD: std_logic; -- señal control de muxD
end record;

type tp_camino_s is record
   palabra: st_palabra_dat;
	camp_DL: st_bloque_dat;
   camp_AF: std_logic;
   camp_EST: st_estado;
   dir_EXP: st_dir_bloque;
end record;

end package camino_dat_pkg;


