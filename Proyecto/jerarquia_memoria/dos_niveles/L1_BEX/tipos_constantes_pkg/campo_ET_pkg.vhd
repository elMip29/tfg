library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_ET_pkg is

type tp_memoria_et_e is record
   acc: std_logic;
   dir: st_dir_conjunto;
   pe: std_logic;
   DE: st_etiqueta;
end record;

type tp_memoria_et_e_L2 is record
   acc: std_logic;
   dir: st_dir_conjunto_L2;
   pe: std_logic;
   DE: st_etiqueta_L2;
end record;

type tp_etiq_e is record
	acc: std_logic;
	dirB: st_dir_bloque;
   esc : std_logic;
end record;

--type tp_etiq_e_L2 is record
--	acc: std_logic;
--	dirB: st_dir_bloque;
--   esc : std_logic;
--end record;

subtype AF is std_logic;

end package campo_ET_pkg;

