library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;

package cache_con_inter_proc_pkg is

component cache_con_interface_proc is
 port(reloj: in std_logic;
      pcero: in  std_logic;
		pet_proc: in tp_peticion;
		resp_m: in tp_cntl_memoria_e;
		mbloque: in st_bloque_dat;
		mem_ocupada: in std_logic;
		acc_lec: in std_logic;
		pet_m: out tp_peticion_mem;
		resp_cache: out tp_respuesta;
		pet_listo: out std_logic);
end component;

component mem_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
       m_pet: in std_logic;
       m_val: in std_logic;
       ocupada_mem: out std_logic);
end component;


end package cache_con_inter_proc_pkg;
