library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_1_pkg.all;
use work.peticiones_cache_pkg.all;

entity jerarquia is 
 port(reloj: in std_logic;
      pcero: in std_logic;
		pet_prod: in tp_peticion; 
		resp_cache: out tp_respuesta;
		cache_lista: out std_logic);
end jerarquia;


architecture esctructural of jerarquia is 




begin



-- Memoria Principal --
memoria: 
 




end;