library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;

package componentes_interface_L1_con_L2_pkg is 

component interface_L1_L2_pet is
  port(pet_a_L2: in tp_peticion_L2;
       pet_enviada: out tp_peticion_l2);
end component;

component interface_L1_L2_resp is
  port(respuesta: in tp_respuesta_L2;
       resp_recibida: out tp_respuesta_L2);
end component;

component cache_con_interface_proc is
  port(reloj: in std_logic;
       pcero: in  std_logic;
		 pet_proc: in tp_peticion;
		 resp_L2: in std_logic;
		 L2_ocupada: in std_logic;
		 L2_bloque: in st_bloque_dat;
		 acc_lec: in std_logic;
		 pet_listo: out std_logic;
		 resp_cache: out tp_respuesta;
		 pet_L2: out tp_peticion_L2);
end component;

component mod_L2_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_L2: in std_logic;
		 lista: in std_logic;
		 ocupada_L2: out std_logic);
end component;

end package componentes_interface_L1_con_L2_pkg;

