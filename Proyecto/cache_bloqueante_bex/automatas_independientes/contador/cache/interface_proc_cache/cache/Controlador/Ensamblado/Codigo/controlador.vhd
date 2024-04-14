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
		 conc_arb: in tp_arb_resp;
		 s_control: out tp_contro_cam_cntl;
		 pet_arb: out tp_arb_pet;
		 pet_arb_bex: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
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

begin 

-- Circuiteria para decidir que peticion de memoria se ha de enviar por el bus --
sel_pet_memoria: muxM port map(pet_m_fallo => pet_m_f, pet_m_exp => pet_m_e, concesion_arb => conc_arb, pet_m_s => pet_m);

-- Controlador del Camino de datos --
automata_fallo: auto_fallo port map(reloj => reloj, pcero => pcero, pet => pet, info_estado => info_estado, mem_ocupada => mem_ocupada, conc_arb => conc_arb.conc_fallo_arb, 
                                    s_control => s_control_f, pet_arb => pet_arb, bex_control => bex_control_f, resp => resp, pet_m => pet_m_f);

-- Controlador del Buffer de expulsiones --
automata_expulsion: auto_exp port map(reloj => reloj, pcero => pcero, forzar_exp => conc_arb.forzar_exp, concesion_arb => conc_arb.conc_exp_arb, mem_ocupada => mem_ocupada, 
                                      pet_arb_bex => pet_arb_bex, s_expulsion => s_expulsion_inter, bex_control => bex_control_e, pet_m => pet_m_e);

-- Interconexion --	  
s_control <= (DAT_acc => s_control_f.DAT_acc, 
              DAT_palabra_esc => s_control_f.DAT_palabra_esc,
				  DAT_bloque_esc => s_control_f.DAT_bloque_esc,
				  EST_acc => s_control_f.EST_acc, 
				  EST_esc => s_control_f.EST_esc, 
				  EST_DE => s_control_f.EST_DE, 
				  ET_acc => s_control_f.ET_acc, 
				  ET_esc => s_control_f.ET_esc,
				  muxB => s_control_f.muxB, 
				  FALLO => s_control_f.FALLO, 
				  EXP => s_expulsion_inter);

bex_control <= (pe => bex_control_f.pe, 
                val_PBL => bex_control_f.val_PBL, 
					 val_EXP => bex_control_e.val_EXP, 
					 pe_val_PBL => bex_control_f.pe_val_PBL, 
					 pe_val_EXP => bex_control_e.pe_val_EXP);

end estructural;