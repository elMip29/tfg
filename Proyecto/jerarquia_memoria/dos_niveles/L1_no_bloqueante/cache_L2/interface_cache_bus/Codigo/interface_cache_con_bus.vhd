library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.controlador_pkg.all;
use work.L2_con_inter_L1_pkg.all;

entity interface_cache_con_bus is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
		  pet_L1: in tp_peticion_L2;
		  mresp_cntl_bus: in tp_respuesta_control;
		  mresp_datos_bus: in tp_respuesta_datos;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta_L2;
		  val_BC: out std_logic;
		  s_error: out std_logic;
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

begin

-- interconexión
mpet_cntl_e <= (m_pet => pet_m_inter.m_pet,
				    m_pe => pet_m_inter.m_esc);

resp_m <= (m_val => mresp_cntl_s.m_val, 
           LE_mem => mresp_cntl_s.LE_mem,
			  identificador => mresp_info_s.identificador);

mdato <= mresp_info_s.m_dato;

mpet_info_e <= (dir => pet_m_inter.m_dir,
				    dato_escribir => pet_m_inter.m_DE);

-- L2 con interface L1
cach_L2: L2_con_interface_L1 port map(reloj => reloj, pcero => pcero, pet_L1 => pet_L1, resp_m => resp_m, mbloque => mdato,
                                      pet_m => pet_m_inter, resp_L2 => resp_cache, val_BC => val_BC, pet_listo => pet_listo, 
												  s_error => s_error); 

-- interface con el bus: informacion
inter_Pr_BUS_IN: interface_cache_bus_info port map (reloj => reloj, pcero => pcero, mpet_info_e => mpet_info_e, 
                                                    mresp_info_bus => mresp_datos_bus, mpet_info_bus => mpet_datos_bus,
												                mresp_info_s => mresp_info_s);

-- interface con el bus: control
inter_Pr_BUS_CON: interface_cache_bus_control port map (reloj => reloj, pcero => pcero,  mpet_cntl_e => mpet_cntl_e,
                                                        mresp_cntl_bus => mresp_cntl_bus, mpet_cntl_bus => mpet_cntl_bus,
												                    mresp_cntl_s => mresp_cntl_s);
																		  
end estructural;