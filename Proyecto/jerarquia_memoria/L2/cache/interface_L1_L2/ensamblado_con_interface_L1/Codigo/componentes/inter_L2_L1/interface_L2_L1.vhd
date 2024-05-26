library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.inter_L2_L1_pkg.all;

entity interface_L2_L1 is
	port(reloj: in std_logic;
	     respuesta: in tp_respuesta;
		  resp_cache: out tp_respuesta);
end interface_L2_L1;

architecture estruc of interface_L2_L1 is

begin

-- Registro para almacenar la respuesta de la cache L2 a la L1 --
inter_reg_L2_L1: reg_L2_L1 port map(reloj => reloj, entrada => respuesta, pe => respuesta.valido, salida => resp_cache);

end;