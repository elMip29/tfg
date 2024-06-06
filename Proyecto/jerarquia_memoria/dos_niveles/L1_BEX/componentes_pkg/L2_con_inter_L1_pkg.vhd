library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;

package L2_con_inter_L1_pkg is

component L2_con_interface_L1 is
 port(reloj: in std_logic;
      pcero: in  std_logic;
      pet_L1: in tp_peticion_L2;
      resp_m: in tp_cntl_memoria_e;
      mbloque: in st_bloque_dat;
      pet_m: out tp_peticion_mem;
      resp_L2: out tp_respuesta_L2;
      pet_listo: out std_logic;
		s_error: out std_logic);
end component;

end package L2_con_inter_L1_pkg;
