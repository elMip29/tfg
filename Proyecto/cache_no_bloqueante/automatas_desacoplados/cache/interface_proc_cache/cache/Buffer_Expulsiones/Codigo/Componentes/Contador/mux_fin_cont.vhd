library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity mux_fin_cont is 
   port(entrada_reg: in tam_contador_bex;  
	     contador_act: in tam_contador_bex;
		  final: in std_logic;
		  salida: out tam_contador_bex);
end entity;

architecture comportamiento of mux_fin_cont is 

begin 

salida <= entrada_reg when (not final = '0') else contador_act;

end comportamiento;