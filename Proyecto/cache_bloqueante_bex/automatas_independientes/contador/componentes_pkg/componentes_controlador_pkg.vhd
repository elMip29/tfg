library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

package componentes_controlador_pkg is 

component auto_fallo is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 mem_ocupada: in std_logic;
		 conc_arb: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 pet_arb: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

component auto_exp is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 forzar_exp: in std_logic;
		 concesion_arb: in std_logic;
		 mem_ocupada: in std_logic;
		 pet_arb_bex: out tp_arb_pet;
		 s_expulsion: out std_logic;
		 bex_control: out tp_cntl_bex;
		 pet_m: out tp_cntl_memoria_s);
end component;

component muxM is 
  port(pet_m_fallo: in tp_cntl_memoria_s;
       pet_m_exp: in tp_cntl_memoria_s;
		 concesion_arb: in tp_arb_resp;
		 pet_m_s: out tp_cntl_memoria_s);
end component;

end componentes_controlador_pkg;