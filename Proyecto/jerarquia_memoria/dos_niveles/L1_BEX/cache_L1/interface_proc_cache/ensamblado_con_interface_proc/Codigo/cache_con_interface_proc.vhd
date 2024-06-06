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
		 resp_L2: in std_logic;
		 L2_lista: in std_logic;
		 L2_bloque: in st_bloque_dat;
		 pet_listo: out std_logic;
		 resp_cache: out tp_respuesta;
		 pet_L2: out tp_peticion_L2);
end entity;

architecture estructura of cache_con_interface_proc is 

signal t_pet_listo: std_logic;
signal peticion: tp_peticion;
signal respuesta_inter: tp_respuesta;
signal pet_L2_inter: tp_cntl_L2_s;
signal bloque_leido_inter: st_bloque_dat;
signal dirB_mem_inter: st_dir_bloque;
signal dato_escribir_inter: st_bloque_dat;
signal l2_pet_val: std_logic;
signal validez_bex_inter: std_logic;

begin 

-- interface procesador - cache --
inter_Pr_ca: interface_proc_cache port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, pet_listo => pet_listo, 
										             peticion => peticion, pet_cache_listo => t_pet_listo);
-- cache --
cache: ensamblado_cache port map (reloj => reloj, pcero => pcero, peticion => peticion, L2_lista => L2_lista, L2_bloque => L2_bloque,
                                     resp_L2 => resp_L2, pet_L2 => pet_L2_inter, respuesta => respuesta_inter, listo => t_pet_listo, 
											    bloque_leido => bloque_leido_inter, dirB_mem => dirB_mem_inter, validez_bex => validez_bex_inter);
							
-- peticion a memoria --
--dir_acc_m <= dirB_expulsion_inter when pet_m_inter.m_esc = '1' else peticion.dir(15 downto 1);
dato_escribir_inter <= pet_proc.dato_escribir(7 downto 0) & pet_proc.dato_escribir(7 downto 0) when pet_L2_inter.l2_ini = '1' else bloque_leido_inter;
l2_pet_val <= '1' when pet_L2_inter.l2_acc = '1' and ((pet_L2_inter.l2_esc = '1' and validez_bex_inter = '1') or (pet_l2_inter.l2_esc = '0')) else '0';

pet_L2 <= (acc => l2_pet_val,
           dir => dirB_mem_inter & '0',
		     esc => pet_L2_inter.l2_esc,
		     ini => pet_L2_inter.l2_ini,
		     dato_escribir => dato_escribir_inter,
			  expulsion => pet_L2_inter.l2_exp);

-- interface cache - procesador --
inter_ca_Pr: interface_cache_proc port map(respuesta => respuesta_inter, resp_cache => resp_cache);

end;