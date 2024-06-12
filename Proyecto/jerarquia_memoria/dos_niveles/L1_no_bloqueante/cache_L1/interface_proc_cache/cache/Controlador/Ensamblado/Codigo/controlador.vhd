library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.componentes_controlador_pkg.all;

entity controlador is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 tipo_exp: in std_logic;
		 acceso_lec: in std_logic;
		 conc_arb: in tp_arb_resp;
		 conc_arb_recursos: in tp_arb_resp_recursos;
		 op_LE: in std_logic;
		 fallo_sec: in std_logic;
		 iden_pet: integer;
		 val_BDF: in std_logic;
		 val_BC: in std_logic;
		 val_BEX: in std_logic;
		 L2_ocupada: in std_logic;
		 mismo_cont_L2: in std_logic;
		 resp_L2: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 pet_arb: out tp_arb_pet;
		 pet_arb_bex: out tp_arb_pet;
		 pet_arb_recursos: out tp_arb_recursos_pet;
		 bex_control: out tp_cntl_bex;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_L2: out tp_cntl_L2_s);
end entity;

architecture estructural of controlador is 

signal s_control_f: tp_contro_cam_cntl;
signal s_expulsion_inter: std_logic;

signal bex_control_f: tp_cntl_bex;
signal bex_control_e: tp_cntl_bex;

signal pet_L2_f: tp_cntl_L2_s;
signal pet_L2_e: tp_cntl_L2_s;

signal s_control_acierto_inter: tp_contro_cam_acceso;
signal s_control_fallo_inter: tp_contro_cam_fallo;
signal control_ET_inter: tp_contro_ET;
signal control_EST_inter: tp_contro_EST;
signal control_DAT_inter: tp_contro_DAT;

signal muxBsel: std_logic;

signal pet_arb_camino_acceso: tp_arb_recursos_pet;
signal pet_arb_acceso: tp_arb_pet;
signal bdf_control_inter: tp_cntl_bdf;
signal resp_inter: tp_contro_s;

signal pet_arb_camino_fallo: tp_arb_recursos_pet;
signal pet_arb_fallo: tp_arb_pet;
signal bdf_control_fallo: tp_cntl_bdf;
signal resp_fallo: tp_contro_s;

signal iden_respuesta: integer;
signal control_resp: std_logic;

signal pet_inicio_L2: tp_cntl_L2_s;


begin 

-- Circuiteria para decidir que peticion se ha de enviar por el canal de peticiones a L2 --
sel_pet_L2: muxM port map(pet_L2_fallo => pet_L2_f, pet_L2_exp => pet_L2_e, pet_L2_ini => pet_inicio_L2, concesion_arb => conc_arb, pet_L2_s => pet_L2);

-- Controlador de Acierto del Camino de datos --
automata_acceso: auto_acceso port map(reloj => reloj, pcero => pcero, pet => pet, info_estado => info_estado, conc_arb => conc_arb_recursos.conc_recursos_acceso, val_BDF => val_BDF,
                                      val_BEX => val_BEX, fallo_secundario => fallo_sec, mismo_cont_L2 => mismo_cont_L2, L2_ocupada => L2_ocupada, s_control_acierto => s_control_acierto_inter, 
												  pet_arb_camino => pet_arb_camino_acceso, pet_arb_bus => pet_arb_acceso, bex_control => bex_control_f, bdf_control => bdf_control_inter, resp => resp_inter, 
												  pet_L2 => pet_inicio_L2);

-- Controlador de Fallo del Camino de datos --
automata_fallo: auto_fallo port map(reloj => reloj, pcero => pcero, L2_ocupada => L2_ocupada, iden_pet => iden_pet, acceso_lec => acceso_lec, conc_arb_bus => conc_arb.conc_fallo_arb, 
                                    conc_arb_camino => conc_arb_recursos.conc_recursos_fallo, op_LE => op_LE, val_BDF => val_BDF, val_BC => val_BC, mismo_cont_L2 => mismo_cont_L2, 
												s_control_fallo => s_control_fallo_inter, pet_arb_bus => pet_arb_fallo, pet_arb_camino => pet_arb_camino_fallo, bdf_control => bdf_control_fallo, 
												bc_control => bc_control, resp => resp_fallo, pet_L2 => pet_L2_f);

-- Controlador del Buffer de expulsiones --
automata_expulsion: auto_exp port map(reloj => reloj, pcero => pcero, forzar_exp => conc_arb.forzar_exp, concesion_arb => conc_arb.conc_exp_arb, tipo_exp => tipo_exp, pet_arb_bex => pet_arb_bex, 
                                      s_expulsion => s_expulsion_inter, bex_control => bex_control_e, pet_L2 => pet_L2_e);

-- Multiplexores acceso Campos Cache --
muxsCamDat: ensamblado_muxCamDatos port map(entrada_acierto => s_control_acierto_inter, entrada_fallo => s_control_fallo_inter, conc_arb_recursos => conc_arb_recursos, control_ET => control_ET_inter, 
                                            control_EST => control_EST_inter, control_DAT => control_DAT_inter);

-- Interconexion --	  
s_control <= (DAT_acc => control_DAT_inter.DAT_acc, 
              DAT_palabra_esc => control_DAT_inter.DAT_palabra_esc,
				  DAT_bloque_esc => control_DAT_inter.DAT_bloque_esc,
				  EST_acc => control_EST_inter.EST_acc, 
				  EST_esc => control_EST_inter.EST_esc,
				  EST_esc_ocupado => control_EST_inter.EST_esc_ocupado, 
				  EST_DE => control_EST_inter.EST_DE, 
				  ET_acc => control_ET_inter.ET_acc, 
				  ET_esc => control_ET_inter.ET_esc,
				  FALLO => s_control_fallo_inter.FALLO, 
				  EXP => s_expulsion_inter, 
				  muxB => s_control_fallo_inter.muxB);

bex_control <= (pe => bex_control_f.pe, 
                val_PBL => bex_control_f.val_PBL, 
					 val_EXP => bex_control_e.val_EXP, 
					 pe_val_PBL => bex_control_f.pe_val_PBL, 
					 pe_val_EXP => bex_control_e.pe_val_EXP,
					 tipo_exp => bex_control_f.tipo_exp);
					 
pet_arb <= (pet_arb => pet_arb_acceso.pet_arb or pet_arb_fallo.pet_arb,
            pet_arb_exp => pet_arb_acceso.pet_arb_exp or pet_arb_fallo.pet_arb_exp,
            pet_bex_arb => pet_arb_acceso.pet_bex_arb or pet_arb_fallo.pet_bex_arb);

bdf_control <= (pe_bdf => bdf_control_inter.pe_bdf or bdf_control_fallo.pe_bdf,
                esc => bdf_control_inter.esc or bdf_control_fallo.esc,
			       validez_bdf => bdf_control_inter.validez_bdf or bdf_control_fallo.validez_bdf,
			       pe_val_bdf => bdf_control_inter.pe_val_bdf or bdf_control_fallo.pe_val_bdf);
					 
pet_arb_recursos <= (pet_arb_acceso => pet_arb_camino_acceso.pet_arb_acceso,
                     pet_arb_fallo => pet_arb_camino_fallo.pet_arb_fallo);

-- Multiplexor para seleccionar el identificador de la peticion que hay que enviar --
control_resp <= (not resp_inter.finalizada) and resp_fallo.finalizada;
iden_respuesta <= resp_fallo.identificador when control_resp = '1' else resp_inter.identificador;
		
resp <= (listo => resp_inter.listo or resp_fallo.listo,
         finalizada => resp_inter.finalizada or resp_fallo.finalizada,
			identificador => iden_respuesta);
			
end estructural;