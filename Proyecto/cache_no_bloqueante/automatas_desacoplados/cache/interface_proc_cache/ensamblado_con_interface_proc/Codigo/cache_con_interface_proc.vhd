library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_cache_con_inter_proc_pkg.all;

entity cache_con_interface_proc is
  port(reloj: in std_logic;
       pcero: in  std_logic;
		 pet_proc: in tp_peticion;
		 mbloque: in st_bloque_dat;
		 mem_ocupada: in std_logic;
		 acc_lec: in std_logic;
		 pet_m: out tp_peticion_mem;
		 resp_cache: out tp_respuesta;
		 pet_listo: out std_logic);
end entity;

architecture estructura of cache_con_interface_proc is 

signal t_pet_listo: std_logic;
signal peticion: tp_peticion;
signal respuesta_inter: tp_respuesta;
signal pet_m_inter: tp_cntl_memoria_s;
signal bloque_leido_inter: st_bloque_dat;
signal dirB_memoria_inter: st_dir_bloque;
signal validez_bex_inter: std_logic;
signal dir_acc_m: st_dir_bloque;
signal m_pet_val: std_logic;
signal pendiente_inter: std_logic;

begin 
-- interface procesador - cache --
inter_Pr_ca: interface_proc_cache port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, pet_listo => pet_listo, 
										             peticion => peticion, pet_cache_listo => t_pet_listo);
-- cache --
cache: ensamblado_cache port map (reloj => reloj, pcero => pcero, peticion => peticion, mbloque => mbloque, mem_ocupada => mem_ocupada, acc_lec => acc_lec,
                                  pet_m => pet_m_inter, respuesta => respuesta_inter, listo => t_pet_listo,
											 bloque_leido => bloque_leido_inter, dirB_memoria => dirB_memoria_inter, validez_bex => validez_bex_inter);
							
-- peticion a memoria --
dir_acc_m <= dirB_memoria_inter; 
m_pet_val <= '1' when pet_m_inter.m_acc = '1' and ((pet_m_inter.m_esc = '1' and validez_bex_inter = '1') or (pet_m_inter.m_esc = '0')) else '0';

pet_m <= (m_pet => m_pet_val,
		    m_esc=> pet_m_inter.m_esc,
		    m_dir => dir_acc_m,
		    m_DE => bloque_leido_inter);

-- interface cache - procesador --
inter_ca_Pr: interface_cache_proc port map(respuesta => respuesta_inter, resp_cache => resp_cache);

end;