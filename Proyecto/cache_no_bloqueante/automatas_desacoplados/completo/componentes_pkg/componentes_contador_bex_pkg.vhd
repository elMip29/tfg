library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_contador_bex_pkg is 

component reg_counter is 
 port(reloj: in std_logic;
	   pcero: in std_logic;
	   entrada: in tam_contador_bex;
		salida: out tam_contador_bex);
end component;

component mux_bex_val is 
 port(contador_e: in tam_contador_bex;
	   bex_val_sel: in std_logic;
		salida: out tam_contador_bex);	
end component;

component mux_fin_cont is 
   port(entrada_reg: in tam_contador_bex;  
	     contador_act: in tam_contador_bex;
		  final: in std_logic;
		  salida: out tam_contador_bex);
end component;

end package componentes_contador_bex_pkg;