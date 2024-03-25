library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
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
		 bex_control: out tp_cntl_bex;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

component buffer_expulsiones is 
     port(reloj: in std_logic;
	       pcero: in std_logic;
		    bex_control: in tp_cntl_bex;
		    dirExpulsion: in st_dir_bloque;
		    bloque_expulsar: in st_bloque_dat;
		    dir_bex: out st_dir_bloque;
		    bloque_bex: out st_bloque_dat;
		    validez_bex: out std_logic);
end component;

end package componentes_cache_pkg;