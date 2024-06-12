library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;

package componentes_L2_con_inter_L1_pkg is

component ensamblado_cache_L2 is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 peticion: in tp_peticion_L2;
		 resp_m: in tp_cntl_memoria_e;
		 mbloque: in st_bloque_dat;
		 pet_m: out tp_cntl_memoria_s;
		 respuesta: out tp_respuesta_L2;
		 listo: out std_logic;
		 val_BC: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_expulsion: out st_dir_bloque;
		 s_error: out std_logic);
end component;

component interface_L1_L2 is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_L1: in tp_peticion_L2;
		 pet_cache_listo: in std_logic;
		 pet_listo: out std_logic;
		 peticion: out tp_peticion_L2);
end component;

component interface_L2_L1 is
  port(reloj: in std_logic;
       pcero: in std_logic;
       respuesta: in tp_respuesta_L2;
		 resp_cache: out tp_respuesta_L2);
end component;

end package componentes_L2_con_inter_L1_pkg;
