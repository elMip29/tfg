library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;

entity mux_EST is
   port(entrada_acierto: in tp_contro_EST; 
	     entrada_fallo: in tp_contro_EST;
	     sel: in std_logic;
		  salida: out tp_contro_EST); 
end entity;

architecture comportamiento of mux_EST is 

begin 

salida <= entrada_acierto when (sel = '0') else entrada_fallo;

end comportamiento;