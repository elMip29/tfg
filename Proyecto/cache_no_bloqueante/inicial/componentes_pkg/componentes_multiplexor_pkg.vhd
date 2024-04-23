library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

package componentes_multiplexor_pkg is

component muxB is 
  port(bloque_memoria: in st_bloque_dat;
       dato_procesador: in st_bloque_dat;
		 sel: in std_logic;
		 salida: out st_bloque_dat);
end component;

component muxE is 
  port(dir_bloque_proc: in st_dir_bloque;
       dir_bloque_exp: in st_dir_bloque;
		 sel_FALLO: in std_logic;
		 sel_EXP: in std_logic;
		 salida: out st_dir_bloque);
end component;

component mux_bdf_dir is 
   port(entrada_proc: in st_dir; 
	     entrada_bdf: in st_dir; 
		  sel: in std_logic; 
		  salida: out st_dir);
end component;

component mux_bdf_dat is 
   port(entrada_proc: in st_palabra_dat; 
	     entrada_bdf: in st_palabra_dat; 
		  sel: in std_logic; 
		  salida: out st_palabra_dat);
end component;

component muxD is 
  port(palabra_0: in st_palabra_dat;
       palabra_1: in st_palabra_dat;
		 sel: in std_logic;
		 salida: out st_palabra_dat);
end component;

component muxET is 
  port(ET_e: in tp_etiq_e;
       ET_e_fallo: in tp_etiq_e;
		 sel: in std_logic;
		 ET_salida: out tp_etiq_e);
end component;

component muxEST is 
  port(EST_e: in tp_est_e;
       EST_e_fallo: in tp_est_e;
		 sel: in std_logic;
		 EST_salida: out tp_est_e);
end component;

component muxDAT is 
  port(DAT_e: in tp_datos_e;
       DAT_e_fallo: in tp_datos_e;
		 sel: in std_logic;
		 DAT_salida: out tp_datos_e);
end component;

end package componentes_multiplexor_pkg;