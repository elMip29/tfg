library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;

package componentes_cache_con_inter_proc_pkg is

component ensamblado_cache is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 peticion: in tp_peticion;
		 L2_lista: in std_logic;
		 L2_bloque: in st_bloque_dat;
		 resp_L2: in std_logic;
		 pet_L2: out tp_cntl_L2_s;
		 respuesta: out tp_respuesta;
		 listo: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_mem: out st_dir_bloque;
		 validez_bex: out std_logic);
end component;

component interface_proc_cache is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_proc: in tp_peticion;
		 pet_cache_listo: in std_logic;
		 pet_listo: out std_logic;
		 peticion: out tp_peticion);
end component;

component interface_cache_proc is
  port(respuesta: in tp_respuesta;
		 resp_cache: out tp_respuesta);
end component;

end package componentes_cache_con_inter_proc_pkg;
