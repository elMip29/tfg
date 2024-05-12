library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;

package componentes_muxCamDatos_pkg is 

component mux_ET is
   port(entrada_acierto: in tp_contro_ET; 
	     entrada_fallo: in tp_contro_ET;
	     sel: in std_logic;
		  salida: out tp_contro_ET); 
end component;

component mux_EST is
   port(entrada_acierto: in tp_contro_EST; 
	     entrada_fallo: in tp_contro_EST;
	     sel: in std_logic;
		  salida: out tp_contro_EST); 
end component;

component mux_DAT is
   port(entrada_acierto: in tp_contro_DAT; 
	     entrada_fallo: in tp_contro_DAT;
	     sel: in std_logic;
		  salida: out tp_contro_DAT); 
end component;

end componentes_muxCamDatos_pkg;