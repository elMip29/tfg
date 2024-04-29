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
		 acceso_lec: in std_logic;
		 reg_acceso_lec: in std_logic;
		 conc_arb: in std_logic;
		 op_LE: in std_logic;
		 val_BDF: in std_logic;
		 val_BC: in std_logic;
		 s_control_acierto: out tp_contro_cam_acierto;
		 s_control_fallo: out tp_contro_cam_fallo;
		 pet_arb: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s;
		 pe_regAsociadoBC: out std_logic);
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

component regAsociadoBC is 
   port(reloj: in std_logic;
        pcero: in std_logic;
		  entrada: in std_logic;
		  pe: in std_logic;
		  salida: out std_logic);
end component;

component ensamblado_muxCamDatos is
   port(entrada_acierto: in tp_contro_cam_acierto; 
	     entrada_fallo: in tp_contro_cam_fallo;
	     control_ET: out tp_contro_ET; 
		  control_EST: out tp_contro_EST; 
		  control_DAT: out tp_contro_DAT);
end component;

end componentes_controlador_pkg;