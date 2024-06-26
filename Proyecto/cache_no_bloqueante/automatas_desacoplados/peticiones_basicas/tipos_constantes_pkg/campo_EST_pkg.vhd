library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_EST_pkg is

type tp_est_e is record
    acc: std_logic;
    dir: st_dir_conjunto;
    esc: std_logic;
	 esc_ocupado: std_logic;
    DE: st_estado;
end record;

end package campo_EST_pkg;

