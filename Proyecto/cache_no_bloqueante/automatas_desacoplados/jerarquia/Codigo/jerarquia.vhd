library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_jerarquia_pkg.all;

entity jerarquia is 
 port(reloj: in std_logic;
      pcero: in std_logic;
		pet_proc: in tp_peticion; 
		resp_cache: out tp_respuesta;
		cache_lista: out std_logic);
end jerarquia;

architecture esctructural of jerarquia is 

signal mpet_datos_bus_inter, mpet_datos_bus_c: tp_peticion_datos;
signal mresp_datos_bus_inter, mresp_datos_bus_c: tp_respuesta_datos;

signal mpet_cntrl_bus_inter, mpet_cntl_bus_c: tp_peticion_control;
signal mresp_cntrl_bus_inter, mresp_cntl_bus_c: tp_respuesta_control;

begin

-- Cache con interface al bus --
cache_no_bloqueante: interface_cache_con_bus port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, 
                                                      mresp_cntl_bus => mresp_cntl_bus_c, mresp_datos_bus => mresp_datos_bus_c,  
                                                      pet_listo => cache_lista, resp_cache => resp_cache, mpet_cntl_bus => mpet_cntl_bus_c, 
																	   mpet_datos_bus => mpet_datos_bus_c);
-- Interconexiones --
mpet_cntrl_bus_inter <= mpet_cntl_bus_c;
mresp_cntl_bus_c <= mresp_cntrl_bus_inter;
mpet_datos_bus_inter <= mpet_datos_bus_c;
mresp_datos_bus_c <= mresp_datos_bus_inter;
																	
-- Memoria con interface al bus --
memoria: memoria_con_interface_bus port map(reloj => reloj, pcero => pcero, m_pet_datos_bus => mpet_datos_bus_inter,
                                            m_pet_cntrl_bus => mpet_cntrl_bus_inter, m_resp_datos_bus => mresp_datos_bus_inter,
														  m_resp_cntrl_bus => mresp_cntrl_bus_inter);

end;