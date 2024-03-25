library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.controlador_pkg.all;
use work.cache_con_inter_proc_pkg.all;

entity interface_cache_con_bus is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
		  pet_proc: in tp_peticion;
		  mresp_cntl_bus: in tp_respuesta_control;
		  mresp_datos_bus: in tp_respuesta_datos;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta;
		  mpet_cntl_bus: out tp_peticion_control;
		  mpet_datos_bus: out tp_peticion_datos);
end interface_cache_con_bus;

architecture estructural of interface_cache_con_bus is

signal mdato: st_bloque_dat;
signal resp_m: tp_cntl_memoria_e;

signal pet_m_inter: tp_peticion_mem;
signal mpet_cntl_e: tp_peticion_control;
signal mresp_cntl_s: tp_respuesta_control;
signal mpet_info_e: tp_peticion_datos;
signal mresp_info_s: tp_respuesta_datos;

signal memoria_ocupada: std_logic;

begin

-- interconexión
mpet_cntl_e <= (m_pet => pet_m_inter.m_pet,
				    m_pe => pet_m_inter.m_esc);

resp_m <= (m_val => mresp_cntl_s.m_val);

mdato <= mresp_info_s.m_dato;

mpet_info_e <= (dir => pet_m_inter.m_dir,
				    dato_escribir => pet_m_inter.m_DE);

-- cache con interfaces con el procesador 
cach: cache_con_interface_proc port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, resp_m => resp_m, mbloque => mdato,
                                    pet_m => pet_m_inter, resp_cache => resp_cache, pet_listo => pet_listo); 

-- interface con el bus: informacion
inter_Pr_BUS_IN: interface_cache_bus_info port map (reloj => reloj, pcero => pcero, mpet_info_e => mpet_info_e, 
                                                    mresp_info_bus => mresp_datos_bus, mpet_info_bus => mpet_datos_bus,
												                mresp_info_s => mresp_info_s);

-- interface con el bus: control
inter_Pr_BUS_CON: interface_cache_bus_control port map (reloj => reloj, pcero => pcero, mpet_cntl_e => mpet_cntl_e,
                                                        mresp_cntl_bus => mresp_cntl_bus, mpet_cntl_bus => mpet_cntl_bus,
												                    mresp_cntl_s => mresp_cntl_s);
																		  
-- Modulo para mantener el nivel de la señal m_val de memoria
modulo_mem_lista: mem_lista port map(reloj => reloj, pcero => pcero, m_pet => mpet_cntl_e.m_pet, m_val => resp_m.m_val, ocupada_mem => memoria_ocupada);																		  
	
end;