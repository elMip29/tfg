library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

package componentes_camino_pkg is

component ensamblado_etiquetas is 
  port(reloj: in std_logic; 
	    etiq_entrada: in tp_etiq_e;
		DL: out st_etiqueta;
		AF: out std_logic;
		mismo_cont_L2: out std_logic);
end component;

component memoria_EST is 
  port(reloj: in std_logic;
	   EST_e: in tp_est_e;
	   DL: out st_estado);
end component;

component ensamblado_datos is 
  port(reloj: in std_logic;
	   datos_e: in tp_datos_e;
	   DL: out st_bloque_dat);
end component;

component permiso_escritura_DAT is 
  port(byte: in std_logic;
       esc_pala: in std_logic;
	    esc_bloque: in std_logic;
	    pe: out st_bloque_esc);
end component;

component ensamblado_etiquetas_L2 is 
  port(reloj: in std_logic; 
	    etiq_entrada: in tp_etiq_e;
		 DL: out st_etiqueta_L2;
		 AF: out std_logic);
end component;

component memoria_EST_L2 is 
  port(reloj: in std_logic;
	    EST_e: in tp_est_e_L2;
	    DL: out st_estado_L2);
end component;

component ensamblado_datos_L2 is 
  port(reloj: in std_logic;
	   datos_e: in tp_datos_e_L2;
	   DL: out st_bloque_dat);
end component;

end package componentes_camino_pkg;