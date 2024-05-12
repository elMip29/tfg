library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity mux_bex_val is 
   port(contador_e: in tam_contador_bex;
	     bex_val_sel: in std_logic;
		  salida: out tam_contador_bex);	
end entity;

architecture comportamiento of mux_bex_val is 

begin 

salida <= contador_e when (bex_val_sel = '1') else (others => '0');

end comportamiento;