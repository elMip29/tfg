library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.componente_ensamblado_mem_pkg.all;

entity memoria_con_interface_bus is
   port(reloj: in std_logic;
	     pcero: in std_logic;
		  m_pet_datos_bus: in tp_peticion_datos;
		  m_pet_cntrl_bus: in tp_peticion_control;
		  m_resp_datos_bus: out tp_respuesta_datos;
		  m_resp_cntrl_bus: out tp_respuesta_control);
end memoria_con_interface_bus;

architecture estructural of memoria_con_interface_bus is

signal mpet_datos_s: tp_peticion_datos; -- Peticion de datos que llega desde bus para memoria
signal mresp_datos_e: tp_respuesta_datos; -- Dato leido de memoria
signal mresp_control_e: tp_respuesta_control; -- Respuesta valida de memoria
signal mpet_contrl_s: tp_peticion_control; -- Peticion de control que llega desde el bus

signal dir_mem: st_dir_bloque;
signal pe_mem, pet_mem, resp_mem, LE_mem: std_logic;
signal dato_leido_mem, dato_escribir_mem: st_bloque_dat;

begin

--interface con el bus: datos
inter_mem_bus_datos: interface_mem_bus_datos port map(reloj => reloj, pcero => pcero, m_pet_datos_bus => m_pet_datos_bus,
                                                      m_resp_datos_e => mresp_datos_e, m_pet_datos_s => mpet_datos_s,
																		m_resp_datos_bus => m_resp_datos_bus);
--interface con el bus: control
inter_mem_bus_control: interface_mem_bus_control port map(reloj => reloj, pcero => pcero, m_pet_cntl_bus => m_pet_cntrl_bus,
                                                          m_resp_cntl_e => mresp_control_e, m_pet_cntl_s => mpet_contrl_s, 
																			 m_resp_cntl_bus => m_resp_cntrl_bus);

-- memoria 
memoria_principal: ensamblado_memoria port map(reloj => reloj, dir => dir_mem, m_pet_val => pet_mem, m_pe => pe_mem, dato_escribir => dato_escribir_mem, 
                                               LE => LE_mem, m_resp_val => resp_mem, dato_leido => dato_leido_mem);

-- Interconexiones
dir_mem <= mpet_datos_s.dir;
pe_mem <=  mpet_contrl_s.m_pe;
pet_mem <= mpet_contrl_s.m_pet;
mresp_control_e.m_val <= resp_mem;
mresp_control_e.LE_mem <= LE_mem;
mresp_datos_e.m_dato <= dato_leido_mem;
dato_escribir_mem <= mpet_datos_s.dato_escribir;

end;