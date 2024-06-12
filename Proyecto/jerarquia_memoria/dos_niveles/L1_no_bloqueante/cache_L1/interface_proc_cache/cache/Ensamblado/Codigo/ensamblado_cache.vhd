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
		 L2_ocupada: in std_logic;
		 L2_bloque: in st_bloque_dat;
		 resp_L2: in std_logic;
		 acc_lec: in std_logic;
		 pet_L2: out tp_cntl_L2_s;
		 respuesta: out tp_respuesta;
		 listo: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_mem: out st_dir_bloque;
		 validez_bex: out std_logic);
end entity;

architecture estructural of ensamblado_cache is 

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
signal petExp_bex_inter: std_logic;

signal pet_arb_inter: tp_arb_pet;
signal pet_arb_bex_inter: tp_arb_pet;
signal pet_arb_recursos_inter: tp_arb_recursos_pet;
signal conc_arb_inter: tp_arb_resp;
signal conc_arb_recursos_inter: tp_arb_resp_recursos;
signal bex_depen_inter: std_logic;
signal final_contador_inter: std_logic;

signal bdf_control_inter: tp_cntl_bdf;
signal iden_reg_inter: integer;
signal dir_bdf_reg_inter: st_dir;
signal dato_bdf_reg_inter: st_palabra_dat;
signal LE_bdf_reg_inter: std_logic;
signal val_bdf_reg_inter: std_logic;
signal entrada_muxBDF_inter: tp_muxBDF_e;
signal salida_muxBDF_inter: tp_muxBDF_s;

signal bc_control_inter: tp_cntl_bc;
signal bloque_bc: st_bloque_dat;
signal val_bc_inter: std_logic;

signal sel_MuxB_inter: std_logic;
signal fallo_sec_inter: std_logic;

begin 

byte_offset <= salida_muxBDF_inter.dir_muxbdf(0);

dirBloque <= salida_muxBDF_inter.dir_muxbdf(15 downto 1);

dato_proc_replicado <= salida_muxBDF_inter.dato_muxbdf(7 downto 0) & salida_muxBDF_inter.dato_muxbdf(7 downto 0);

-- Camino de datos --
camino_datos_cache: camino_datos port map(reloj => reloj, camino_e => camino_e_inter, camino_s => camino_s_inter);

-- Controladores de cache --
controladores: controlador port map(reloj => reloj, pcero => pcero, pet => pet_controlador, info_estado => info_estado_controlador, tipo_exp => petExp_bex_inter, acceso_lec => acc_lec, conc_arb => conc_arb_inter, 
                                    conc_arb_recursos => conc_arb_recursos_inter, op_LE => LE_bdf_reg_inter, fallo_sec => fallo_sec_inter, iden_pet => iden_reg_inter, val_BDF => val_bdf_reg_inter, 
												val_BC => val_bc_inter, val_BEX => validez_bex_inter, L2_ocupada => L2_ocupada, mismo_cont_L2 => camino_s_inter.mismo_cont_L2, resp_L2 => resp_L2, s_control => s_control_inter, 
												pet_arb => pet_arb_inter, pet_arb_bex => pet_arb_bex_inter, pet_arb_recursos => pet_arb_recursos_inter, bex_control => bex_control_inter, bdf_control => bdf_control_inter, 
												bc_control => bc_control_inter, resp => resp_inter, pet_L2 => pet_L2);
													 
-- Arbitro para la gestion del acceso a memoria y a los recursos del camino de datos --
arbitraje: arbitro port map(pet_fallo => pet_arb_inter.pet_arb , pet_fallo_exp => pet_arb_inter.pet_arb_exp, pet_bex => pet_arb_bex_inter.pet_bex_arb, 
                            pet_rec_fallo => pet_arb_recursos_inter.pet_arb_fallo, pet_rec_acceso => pet_arb_recursos_inter.pet_arb_acceso, L2_ocupada => L2_ocupada, 
									 bex_val => validez_bex_inter, bex_depen => bex_depen_inter, final_contador => final_contador_inter, conc_arb_bus => conc_arb_inter, 
									 conc_arb_recursos => conc_arb_recursos_inter);

-- Multiplexor direccion procesador o direccion bloque expulsado --
mux_E: muxE port map(dir_bloque_proc => dir_bdf_reg_inter(15 downto 1), dir_bloque_exp => dir_bex_inter, sel_FALLO => s_control_inter.FALLO,
                     sel_EXP => s_control_inter.EXP, salida => dirB_mem);
							
-- Buffer de expulsiones --
bex: buffer_expulsiones port map(reloj => reloj, pcero => pcero, bex_control => bex_control_inter, dirExpulsion => camino_s_inter.dir_EXP,
                                 bloque_expulsar => camino_s_inter.camp_DL, dirBloque => dirBloque, dir_bex => dir_bex_inter, bloque_bex => bloque_leido,
											petExp_bex => petExp_bex_inter, validez_bex => validez_bex_inter, bex_depen => bex_depen_inter, final_contador => final_contador_inter);

-- Buffer de direccion de fallo --											
bdf: buffer_DF port map(reloj => reloj, pcero => pcero, dir_fallo => peticion.dir, dato_esc => peticion.dato_escribir, bdf_control => bdf_control_inter,
                        identificador => peticion.identificador, identificador_reg => iden_reg_inter, dir_fallo_reg => dir_bdf_reg_inter, dato_esc_reg => dato_bdf_reg_inter, 
								LE_reg => LE_bdf_reg_inter, val_bdf => val_bdf_reg_inter, fallo_secundario => fallo_sec_inter);

-- Buffer de carga --
bc: buffer_carga port map(reloj => reloj, pcero => pcero, bloque_mem => L2_bloque, acceso_lec => acc_lec, bc_cntl => bc_control_inter, bloque_mem_reg => bloque_bc, 
                          validez_BC => val_bc_inter);
								  
-- Multiplexores BDF --
muxs_bdf: ensamblado_muxBDF port map(conc_arb_recursos => conc_arb_recursos_inter, entrada_BDF => entrada_muxBDF_inter, salida_BDF => salida_muxBDF_inter);

-- Circuiteria para el control del multiplexor MuxB --
control_muxB: MuxB_control port map(conc_fallo_recursos => conc_arb_recursos_inter.conc_recursos_fallo, conc_acceso_recursos => conc_arb_recursos_inter.conc_recursos_acceso,
                                    muxB_interno => s_control_inter.muxB, sel_MuxB => sel_MuxB_inter);

-- entrada multiplexores BDF --
entrada_muxBDF_inter <= (dato_proc => peticion.dato_escribir, 
                         dato_fallo => dato_bdf_reg_inter, 
							    dir_proc => peticion.dir, 
							    dir_fallo => dir_bdf_reg_inter);
								
-- entrada camino datos --
camino_e_inter <= (etiq_acc => s_control_inter.ET_acc,
                   dirB => dirBloque,
						 etiq_esc => s_control_inter.ET_esc,
						 est_acc => s_control_inter.EST_acc,
						 est_esc => s_control_inter.EST_esc,
						 est_esc_ocupado => s_control_inter.EST_esc_ocupado,
						 est_DE => s_control_inter.EST_DE,
						 dat_acc => s_control_inter.DAT_acc,
						 DAT_palabra_esc => s_control_inter.DAT_palabra_esc,
						 DAT_bloque_esc => s_control_inter.DAT_bloque_esc,
						 dat_L2 => bloque_bc,
						 dat_proc => dato_proc_replicado,
						 muxB => sel_MuxB_inter,
						 muxD => byte_offset);

-- entradas controlador --
pet_controlador <= (acc => peticion.acc,
                    esc => peticion.pe,
						  ini => peticion.ini,
						  identificador => peticion.identificador);

info_estado_controlador <= (AF => camino_s_inter.camp_AF,
                            EST => camino_s_inter.camp_EST);
									 
-- Salidas --
respuesta.valido <= resp_inter.finalizada;

respuesta.dato_leido <= camino_s_inter.palabra;

respuesta.identificador <= resp_inter.identificador;
				  
listo <= resp_inter.listo;

validez_bex <= validez_bex_inter;

end estructural;