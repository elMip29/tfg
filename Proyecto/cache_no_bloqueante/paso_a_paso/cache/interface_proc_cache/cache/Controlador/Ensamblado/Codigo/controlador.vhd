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
		 mem_ocupada: in std_logic;
		 acceso_lec: in std_logic;
		 conc_arb: in tp_arb_resp;
		 op_LE: in std_logic;
		 val_BDF: in std_logic;
		 val_BC: in std_logic;
		 s_control: out tp_contro_cam_cntl;
		 pet_arb: out tp_arb_pet;
		 pet_arb_bex: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s; 
		 pet_m: out tp_cntl_memoria_s);
end entity;

architecture estructural of controlador is 

signal s_control_f: tp_contro_cam_cntl;
signal s_expulsion_inter: std_logic;

signal bex_control_f: tp_cntl_bex;
signal bex_control_e: tp_cntl_bex;

signal pet_m_f: tp_cntl_memoria_s;
signal pet_m_e: tp_cntl_memoria_s;

signal reg_acceso_lec: std_logic;
signal pe_regAsociadoBC_inter: std_logic;

signal s_control_acierto_inter: tp_contro_cam_acierto;
signal s_control_fallo_inter: tp_contro_cam_fallo;
signal control_ET_inter: tp_contro_ET;
signal control_EST_inter: tp_contro_EST;
signal control_DAT_inter: tp_contro_DAT;

signal muxBsel: std_logic;

begin 

-- Control MuxB --
muxBsel <= s_control_acierto_inter.muxB or s_control_fallo_inter.muxB;

-- Circuiteria para decidir que peticion de memoria se ha de enviar por el bus --
sel_pet_memoria: muxM port map(pet_m_fallo => pet_m_f, pet_m_exp => pet_m_e, concesion_arb => conc_arb, pet_m_s => pet_m);

-- Controlador del Camino de datos --
automata_fallo: auto_fallo port map(reloj => reloj, pcero => pcero, pet => pet, info_estado => info_estado, mem_ocupada => mem_ocupada, acceso_lec => acceso_lec, 
                                    reg_acceso_lec => reg_acceso_lec, conc_arb => conc_arb.conc_fallo_arb, op_LE => op_LE, val_BDF => val_BDF, val_BC => val_BC, 
												s_control_acierto => s_control_acierto_inter, s_control_fallo => s_control_fallo_inter, pet_arb => pet_arb, bex_control => bex_control_f, 
												bdf_control => bdf_control, bc_control => bc_control, resp => resp, pet_m => pet_m_f, pe_regAsociadoBC => pe_regAsociadoBC_inter);

-- Controlador del Buffer de expulsiones --
automata_expulsion: auto_exp port map(reloj => reloj, pcero => pcero, forzar_exp => conc_arb.forzar_exp, concesion_arb => conc_arb.conc_exp_arb, mem_ocupada => mem_ocupada, 
                                      pet_arb_bex => pet_arb_bex, s_expulsion => s_expulsion_inter, bex_control => bex_control_e, pet_m => pet_m_e);

-- Registro para recordar que se ha de validar el Buffer de Carga --
reg_validar_bc: regAsociadoBC port map(reloj => reloj, pcero => pcero, entrada => acceso_lec, pe => pe_regAsociadoBC_inter, salida => reg_acceso_lec);

-- Multiplexores acceso Campos Cache --
muxsCamDat: ensamblado_muxCamDatos port map(entrada_acierto => s_control_acierto_inter, entrada_fallo => s_control_fallo_inter, control_ET => control_ET_inter, 
                                            control_EST => control_EST_inter, control_DAT => control_DAT_inter);

-- Interconexion --	  
s_control <= (DAT_acc => control_DAT_inter.DAT_acc, 
              DAT_palabra_esc => control_DAT_inter.DAT_palabra_esc,
				  DAT_bloque_esc => control_DAT_inter.DAT_bloque_esc,
				  EST_acc => control_EST_inter.EST_acc, 
				  EST_esc => control_EST_inter.EST_esc, 
				  EST_DE => control_EST_inter.EST_DE, 
				  ET_acc => control_ET_inter.ET_acc, 
				  ET_esc => control_ET_inter.ET_esc,
				  muxB => muxBsel, 
				  FALLO => s_control_fallo_inter.FALLO, 
				  EXP => s_expulsion_inter,
				  muxBDF_fallo => s_control_fallo_inter.muxBDF_fallo, 
				  muxBDF_proc => s_control_acierto_inter.muxBDF_proc);

bex_control <= (pe => bex_control_f.pe, 
                val_PBL => bex_control_f.val_PBL, 
					 val_EXP => bex_control_e.val_EXP, 
					 pe_val_PBL => bex_control_f.pe_val_PBL, 
					 pe_val_EXP => bex_control_e.pe_val_EXP);

end estructural;