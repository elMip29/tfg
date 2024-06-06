library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

entity interface_cache_proc is
	port (respuesta: in tp_respuesta;
		   resp_cache: out tp_respuesta);
end interface_cache_proc;

architecture estruc of interface_cache_proc is

begin

resp_cache <= respuesta;

end;