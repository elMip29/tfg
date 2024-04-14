library ieee;
use ieee.std_logic_1164.all; 

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_cache_pkg.all;
use work.componentes_multiplexor_pkg.all;

entity ensamblado_cache is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 peticion: in tp_peticion;
		 resp_m: in tp_cntl_memoria_e;
		 mbloque: in st_bloque_dat;
		 mem_ocupada: in std_logic;
		 pet_m: out tp_cntl_memoria_s;
		 respuesta: out tp_respuesta;
		 listo: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_memoria: out st_dir_bloque;
		 validez_bex: out std_logic);
end entity;

architecture estructura of ensamblado_cache is 

signal camino_e_inter: tp_camino_e;
signal camino_s_inter: tp_camino_s;

signal pet_controlador: tp_contro_e;
signal info_estado_controlador: tp_contro_cam_estado;
signal s_control_inter: tp_contro_cam_cntl;
signal resp_inter: tp_contro_s;

signal bex_control_inter: tp_cntl_bex;
signal dir_bex_inter: st_dir_bloque;

signal dirBloque: st_dir_bloque;

signal byte_offset: std_logic;

signal dato_proc_replicado: st_bloque_dat;

signal validez_bex_inter: std_logic;

signal pet_arb_inter: tp_arb_pet;
signal pet_arb_bex_inter: tp_arb_pet;
signal conc_arb_inter: tp_arb_resp;
signal forzar_exp_inter: std_logic;
signal conc_fallo_inter: std_logic;
signal conc_exp_inter: std_logic;

signal bex_depen_inter: std_logic;
signal final_contador_inter: std_logic;

begin 

byte_offset <= peticion.dir(0);

dirBloque <= peticion.dir(15 downto 1);

dato_proc_replicado <= peticion.dato_escribir(7 downto 0) & peticion.dato_escribir(7 downto 0);

-- Camino de datos --
camino_datos_cache: camino_datos port map(reloj => reloj, camino_e => camino_e_inter, camino_s => camino_s_inter);

-- Controladores de cache --
controladores: controlador port map(reloj => reloj, pcero => pcero, pet => pet_controlador, info_estado => info_estado_controlador,
                                    mem_ocupada => mem_ocupada, conc_arb => conc_arb_inter, s_control => s_control_inter, pet_arb => pet_arb_inter, 
												pet_arb_bex => pet_arb_bex_inter, bex_control => bex_control_inter, resp => resp_inter, pet_m => pet_m);
													 
-- Arbitro para conceder acceso a memoria --
arbitraje: arbitro port map(pet_fallo => pet_arb_inter.pet_arb , pet_fallo_exp => pet_arb_inter.pet_arb_exp, pet_bex => pet_arb_bex_inter.pet_bex_arb, 
                            mem_ocupada => mem_ocupada, bex_val => validez_bex_inter, bex_depen => bex_depen_inter, final_contador => final_contador_inter, 
									 forzar_exp => forzar_exp_inter, conc_fallo => conc_fallo_inter, conc_exp => conc_exp_inter);

-- Multiplexor direccion procesador o direccion bloque expulsado --
mux_E: muxE port map(dir_bloque_proc => dirBloque, dir_bloque_exp => dir_bex_inter, sel_FALLO => s_control_inter.FALLO,
                     sel_EXP => s_control_inter.EXP, salida => dirB_memoria);
							
-- Buffer de expulsiones --
bex: buffer_expulsiones port map(reloj => reloj, pcero => pcero, bex_control => bex_control_inter, dirExpulsion => camino_s_inter.dir_EXP,
                                 bloque_expulsar => camino_s_inter.camp_DL, dirBloque => dirBloque, dir_bex => dir_bex_inter, bloque_bex => bloque_leido,
											validez_bex => validez_bex_inter, bex_depen => bex_depen_inter, final_contador => final_contador_inter);

-- entrada camino datos --
camino_e_inter <= (etiq_acc => s_control_inter.ET_acc,
                   dirB => peticion.dir(15 downto 1),
						 etiq_esc => s_control_inter.ET_esc,
						 est_acc => s_control_inter.EST_acc,
						 est_esc => s_control_inter.EST_esc,
						 est_DE => s_control_inter.EST_DE,
						 dat_acc => s_control_inter.DAT_acc,
						 DAT_palabra_esc => s_control_inter.DAT_palabra_esc,
						 DAT_bloque_esc => s_control_inter.DAT_bloque_esc,
						 dat_mem => mbloque,
						 dat_proc => dato_proc_replicado,
						 muxB => s_control_inter.muxB,
						 muxD => byte_offset);

-- entradas controlador --
pet_controlador <= (acc => peticion.acc,
                    esc => peticion.pe,
						  ini => peticion.ini);

info_estado_controlador <= (AF => camino_s_inter.camp_AF,
                            EST => camino_s_inter.camp_EST);
									 
-- respuesta del arbitro --
conc_arb_inter <= (conc_fallo_arb => conc_fallo_inter,
                   conc_exp_arb => conc_exp_inter,
						 forzar_exp => forzar_exp_inter);
				
-- Salidas --
respuesta.valido <= resp_inter.finalizada;

respuesta.dato_leido <= camino_s_inter.palabra;
				  
listo <= resp_inter.listo;

validez_bex <= validez_bex_inter;

end;