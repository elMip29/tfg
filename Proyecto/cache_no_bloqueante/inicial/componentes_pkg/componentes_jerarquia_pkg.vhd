library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

package componentes_jerarquia_pkg is

component memoria_con_interface_bus is
   port(reloj: in std_logic;
	     pcero: in std_logic;
		  m_pet_datos_bus: in tp_peticion_datos;
		  m_pet_cntrl_bus: in tp_peticion_control;
		  m_resp_datos_bus: out tp_respuesta_datos;
		  m_resp_cntrl_bus: out tp_respuesta_control);
end component;

component interface_cache_con_bus is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
		  pet_proc: in tp_peticion;
		  mresp_cntl_bus: in tp_respuesta_control;
		  mresp_datos_bus: in tp_respuesta_datos;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta;
		  mpet_cntl_bus: out tp_peticion_control;
		  mpet_datos_bus: out tp_peticion_datos);
end component;

end package componentes_jerarquia_pkg;