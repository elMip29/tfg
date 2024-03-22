library ieee;
use ieee.std_logic_1164.all;

use work.camino_dat_pkg.all;
use work.controlador_pkg.all;

package componentes_cache_pkg is

component camino_datos is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e;
		 camino_s: out tp_camino_s);
end component;

component controlador is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 resp_m: in tp_cntl_memoria_e;
		 s_control: out tp_contro_cam_cntl;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

end package componentes_cache_pkg;