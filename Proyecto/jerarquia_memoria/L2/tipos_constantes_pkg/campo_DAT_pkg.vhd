library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_DAT_pkg is

type tp_mem_dat_e is record
   acc: std_logic;
   dir: st_dir_conjunto;
   esc: std_logic;
   DE: st_bloque_dat;
end record;

type tp_datos_e is record
	acc: std_logic;
	dir: st_dir_conjunto;
   esc: std_logic;
   DE: st_bloque_dat;
end record;

end package campo_DAT_pkg;

