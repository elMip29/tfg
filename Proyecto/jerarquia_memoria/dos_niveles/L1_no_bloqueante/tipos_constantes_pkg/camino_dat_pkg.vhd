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
	est_esc_ocupado: std_logic;
   est_DE: st_estado;
   dat_acc: std_logic;
   DAT_palabra_esc: std_logic;
   DAT_bloque_esc: std_logic;
   dat_L2: st_bloque_dat;
   dat_proc: st_bloque_dat;
   muxB: std_logic; -- señal control de muxB
   muxD: std_logic; -- señal control de muxD
end record;

type tp_camino_e_L2 is record
	etiq_acc: std_logic;
	dirB: st_dir_bloque;
   etiq_esc : std_logic;
   est_acc: std_logic;
   est_esc: std_logic;
   est_DE: st_estado_L2;
   dat_acc: std_logic;
   dat_esc: std_logic;
   dat_mem: st_bloque_dat;
   dat_L1: st_bloque_dat;
   muxB: std_logic; -- señal control de muxB
end record;

type tp_camino_s is record
   palabra: st_palabra_dat;
	camp_DL: st_bloque_dat;
   camp_AF: std_logic;
   camp_EST: st_estado;
   dir_EXP: st_dir_bloque;
	mismo_cont_L2: std_logic;
end record;

type tp_camino_s_L2 is record
	camp_DL: st_bloque_dat;
   camp_AF: std_logic;
   camp_EST: st_estado_L2;
   dir_EXP: st_dir_bloque;
end record;

type tp_muxBDF_e is record
   dato_proc: st_palabra_dat;
	dato_fallo: st_palabra_dat;
	dir_proc: st_dir;
	dir_fallo: st_dir;
end record;

type tp_muxBDF_s is record 
   dato_muxbdf: st_palabra_dat;
	dir_muxbdf: st_dir;
end record;

end package camino_dat_pkg;
