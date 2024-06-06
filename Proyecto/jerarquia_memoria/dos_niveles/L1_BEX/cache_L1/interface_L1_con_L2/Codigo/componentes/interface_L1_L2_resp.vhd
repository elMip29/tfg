library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

entity interface_L1_L2_resp is -- Componente sencillo que identifica el canal de respuestas para la L1
  port(respuesta: in tp_respuesta_L2;
       resp_recibida: out tp_respuesta_L2);
end entity;

architecture comportamiento of interface_L1_L2_resp is 

begin 
							  
resp_recibida <= respuesta;

end comportamiento;