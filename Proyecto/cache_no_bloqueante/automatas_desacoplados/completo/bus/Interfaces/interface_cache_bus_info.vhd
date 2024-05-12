library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;

entity interface_cache_bus_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_e: in  tp_peticion_datos;
		mpet_info_bus: out  tp_peticion_datos;
		mresp_info_bus: in tp_respuesta_datos;
		mresp_info_s: out tp_respuesta_datos);
end interface_cache_bus_info;

architecture estruc of interface_cache_bus_info is

begin

reg_pet_info: RegDatos_pet port map(reloj => reloj, pcero => pcero, entrada => mpet_info_e, salida => mpet_info_bus);

reg_resp_mdato: RegDatos_resp port map(reloj => reloj, pcero => pcero, entrada => mresp_info_bus, salida => mresp_info_s);

end;

