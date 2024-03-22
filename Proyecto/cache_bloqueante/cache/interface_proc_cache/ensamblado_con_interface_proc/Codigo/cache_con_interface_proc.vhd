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
		 resp_m: in tp_cntl_memoria_e;
		 mbloque: in st_bloque_dat;
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
signal dirB_expulsion_inter: st_dir_bloque;
signal dir_acc_m: st_dir_bloque;

begin 
-- interface procesador - cache --
inter_Pr_ca: interface_proc_cache port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, pet_listo => pet_listo, 
										             peticion => peticion, pet_cache_listo => t_pet_listo);
-- cache --
cache: ensamblado_cache port map (reloj => reloj, pcero => pcero, peticion => peticion, resp_m => resp_m, mbloque => mbloque, 
                                  pet_m => pet_m_inter, respuesta => respuesta_inter, listo => t_pet_listo, bloque_leido => bloque_leido_inter,
											 dirB_expulsion => dirB_expulsion_inter);
							
-- peticion a memoria --
dir_acc_m <= dirB_expulsion_inter when pet_m_inter.m_esc = '1' else peticion.dir(15 downto 1);

pet_m <= (m_pet => pet_m_inter.m_pet,
		    m_esc=> pet_m_inter.m_esc,
		    m_dir => dir_acc_m,
		    m_DE => bloque_leido_inter);

-- interface cache - procesador --
inter_ca_Pr: interface_cache_proc port map(respuesta => respuesta_inter, resp_cache => resp_cache);

end;