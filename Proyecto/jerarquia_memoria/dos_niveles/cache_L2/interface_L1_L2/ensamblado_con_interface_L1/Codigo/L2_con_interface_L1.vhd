library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_L2_con_inter_L1_pkg.all;

entity L2_con_interface_L1 is
  port(reloj: in std_logic;
       pcero: in  std_logic;
		 pet_L1: in tp_peticion_L2;
		 resp_m: in tp_cntl_memoria_e;
		 mbloque: in st_bloque_dat;
		 pet_m: out tp_peticion_mem;
		 resp_L2: out tp_respuesta_L2;
		 pet_listo: out std_logic;
		 s_error: out std_logic);
end entity;

architecture estructura of L2_con_interface_L1 is 

signal t_pet_listo: std_logic;
signal peticion: tp_peticion_L2;
signal respuesta_inter: tp_respuesta_L2;
signal pet_m_inter: tp_cntl_memoria_s;
signal bloque_leido_inter: st_bloque_dat;
signal dirB_expulsion_inter: st_dir_bloque;
signal dir_acc_m: st_dir_bloque;

begin 
-- interface cache L1 - cache L2 --
inter_L1_L2: interface_L1_L2 port map(reloj => reloj, pcero => pcero, pet_L1 => pet_L1, pet_cache_listo => t_pet_listo,
                                      pet_listo => pet_listo, peticion => peticion);
-- cache L2 --
cache: ensamblado_cache_L2 port map (reloj => reloj, pcero => pcero, peticion => peticion, resp_m => resp_m, mbloque => mbloque, 
                                  pet_m => pet_m_inter, respuesta => respuesta_inter, listo => t_pet_listo, bloque_leido => bloque_leido_inter,
											 dirB_expulsion => dir_acc_m, s_error => s_error);
							
-- peticion a memoria --
--dir_acc_m <= dirB_expulsion_inter when pet_m_inter.m_esc = '1' else peticion.dir(15 downto 1);

pet_m <= (m_pet => pet_m_inter.m_pet,
		    m_esc=> pet_m_inter.m_esc,
		    m_dir => dir_acc_m,
		    m_DE => bloque_leido_inter);

-- interface cache L2 - cache L1 --
inter_L2_L1: interface_L2_L1 port map(reloj => reloj, respuesta => respuesta_inter, resp_cache => resp_L2);

end estructura;