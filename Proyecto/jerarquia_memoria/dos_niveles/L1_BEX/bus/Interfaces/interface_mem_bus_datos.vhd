library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;

entity interface_mem_bus_datos is
	port (reloj: in std_logic;
	      pcero: in  std_logic;
		  m_pet_datos_bus: in tp_peticion_datos;
		  m_resp_datos_e: in tp_respuesta_datos;
		  m_pet_datos_s: out tp_peticion_datos;
		  m_resp_datos_bus: out tp_respuesta_datos);
end interface_mem_bus_datos;

architecture estructural of interface_mem_bus_datos is

begin

reg_m_pet_datos: RegDatos_pet port map(reloj => reloj, pcero => pcero, entrada => m_pet_datos_bus, salida => m_pet_datos_s);

reg_m_resp_mdato: RegDatos_resp port map(reloj => reloj, pcero => pcero, entrada => m_resp_datos_e, salida => m_resp_datos_bus);

end;

