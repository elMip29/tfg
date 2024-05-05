library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

package componentes_controlador_pkg is 

component auto_fallo is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 mem_ocupada: in std_logic;
		 acceso_lec: in std_logic;
		 conc_arb_bus: in std_logic;
		 conc_arb_camino: in std_logic;
		 op_LE: in std_logic; -- Senyal que indica que tipo de acceso a dado fallo (Lectura o Escritura)
		 val_BDF: in std_logic; -- Senyal validez del buffer de direccion de fallo
		 val_BC: in std_logic; -- Senyal validez buffer de carga
		 lec_ET_EST: out std_logic;
		 s_control_fallo: out tp_contro_cam_fallo;
		 pet_arb_bus: out tp_arb_pet;
		 pet_arb_camino: out tp_arb_recursos_pet;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

component auto_acceso is 
   port(reloj: in std_logic;
        pcero: in std_logic;
		  pet: in tp_contro_e;
		  info_estado: in tp_contro_cam_estado;
		  conc_arb: in std_logic; -- Concesion de los recursos
		  val_BDF: in std_logic; -- Senyal validez del buffer de direccion de fallo
		  val_BEX: in std_logic;
		  lec_ET_EST: in std_logic;
		  s_control_acierto: out tp_contro_cam_acceso;
		  pet_arb_camino: out tp_arb_recursos_pet;
		  pet_arb_bus: out tp_arb_pet;
		  bex_control: out tp_cntl_bex;
		  bdf_control: out tp_cntl_bdf;
		  resp: out tp_contro_s);
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

component ensamblado_muxCamDatos is
   port(entrada_acierto: in tp_contro_cam_acceso; 
	     entrada_fallo: in tp_contro_cam_fallo;
		  conc_arb_recursos: in tp_arb_resp_recursos;
	     control_ET: out tp_contro_ET; 
		  control_EST: out tp_contro_EST; 
		  control_DAT: out tp_contro_DAT);
end component;

end componentes_controlador_pkg;