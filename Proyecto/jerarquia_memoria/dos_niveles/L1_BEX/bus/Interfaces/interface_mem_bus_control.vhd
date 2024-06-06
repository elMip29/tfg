library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;

entity interface_mem_bus_control is
	port (reloj: in std_logic;
	      pcero: in  std_logic;
		  m_pet_cntl_bus: in tp_peticion_control;
		  m_resp_cntl_e: in tp_respuesta_control;
		  m_pet_cntl_s: out tp_peticion_control;
		  m_resp_cntl_bus: out tp_respuesta_control);
end interface_mem_bus_control;

architecture estructural of interface_mem_bus_control is

begin

reg_m_pet_cntl: RegControl_pet port map(reloj => reloj, pcero => pcero, entrada => m_pet_cntl_bus, salida => m_pet_cntl_s);

reg_m_resp_cntl: RegControl_resp port map(reloj => reloj, pcero => pcero, entrada => m_resp_cntl_e, salida => m_resp_cntl_bus);

end;

