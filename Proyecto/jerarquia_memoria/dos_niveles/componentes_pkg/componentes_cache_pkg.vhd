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
		 L2_lista: in std_logic;
		 resp_L2: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 resp: out tp_contro_s;
		 pet_L2: out tp_cntl_L2_s);
end component;

component camino_datos_L2 is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e_L2;
		 camino_s: out tp_camino_s_L2);
end component;

component controlador_L2 is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_L1: in tp_contro_e_L2;
		 info_estado: in tp_contro_cam_estado_L2;
		 resp_m: in tp_cntl_memoria_e;
		 s_control: out tp_contro_cam_cntl_L2;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s;
		 s_error: out std_logic);
end component;

end package componentes_cache_pkg;