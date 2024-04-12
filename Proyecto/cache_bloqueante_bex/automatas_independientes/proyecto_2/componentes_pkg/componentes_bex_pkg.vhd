library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

package componentes_bex_pkg is 

component reg_dirBloque is 
  port(reloj: in std_logic; 
       pe: in std_logic;
	    entrada: in st_dir_bloque;
		 salida: out st_dir_bloque);  
end component;

component reg_bloqueExp is 
  port(reloj: in std_logic; 
       pe: in std_logic;
	    entrada: in st_bloque_dat;
		 salida: out st_bloque_dat);  
end component;

component reg_validezBex is 
   port(reloj: in std_logic;
        pcero: in std_logic;	
	     pe_val: in std_logic;
	     bit_validez: in std_logic;
		  validez_bex: out std_logic);
end component;

component multiplexores_reg_validez is 
   port(val_PBL: in std_logic; 
	     val_EXP: in std_logic;
		  pe_PBL: in std_logic;
		  pe_EXP: in std_logic;
		  validez: out std_logic;
		  pe_val: out std_logic);
end component;

end package componentes_bex_pkg;