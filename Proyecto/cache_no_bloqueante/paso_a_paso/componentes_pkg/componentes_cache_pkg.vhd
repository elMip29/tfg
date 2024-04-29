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
		 mem_ocupada: in std_logic;
		 acceso_lec: in std_logic;
		 conc_arb: in tp_arb_resp;
		 op_LE: in std_logic;
		 val_BDF: in std_logic;
		 val_BC: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 pet_arb: out tp_arb_pet;
		 pet_arb_bex: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

component buffer_expulsiones is 
     port(reloj: in std_logic;
	       pcero: in std_logic;
		    bex_control: in tp_cntl_bex;
		    dirExpulsion: in st_dir_bloque;
		    bloque_expulsar: in st_bloque_dat;
			 dirBloque: in st_dir_bloque;
		    dir_bex: out st_dir_bloque;
		    bloque_bex: out st_bloque_dat;
		    validez_bex: out std_logic;
			 bex_depen: out std_logic;
			 final_contador: out std_logic);
end component;

component arbitro is 
   port(pet_fallo: in std_logic;
	     pet_fallo_exp: in std_logic;
		  pet_bex: in std_logic;
		  mem_ocupada: in std_logic;
		  bex_val: in std_logic;
		  bex_depen: in std_logic;
		  final_contador: in std_logic;
		  forzar_exp: out std_logic;
		  conc_fallo: out std_logic;
		  conc_exp: out std_logic);
end component;

component buffer_DF is 
  port(reloj: in std_logic; 
	    pcero: in std_logic;
		 dir_fallo: in st_dir;
		 dato_esc: in st_palabra_dat;
		 bdf_control: in tp_cntl_bdf;
		 dir_fallo_reg: out st_dir;
		 dato_esc_reg: out st_palabra_dat;
		 LE_reg: out std_logic; -- bit para ver si es lectura o escritura
		 val_bdf: out std_logic);
end component;

component buffer_carga is 
  port(reloj: in std_logic; 
       pcero: in std_logic;
		 bloque_mem: in st_bloque_dat;
		 acceso_lec: in std_logic; -- Senyal para validar el buffer de carga
		 bc_cntl: in tp_cntl_bc;
		 bloque_mem_reg: out st_bloque_dat;
       validez_BC: out std_logic);
end component;

component ensamblado_muxBDF is 
   port(muxBDF_1: in std_logic; 
	     muxBDF_2: in std_logic; 
		  entrada_BDF: in tp_muxBDF_e; 
		  salida_BDF: out tp_muxBDF_s);
end component;


end package componentes_cache_pkg;