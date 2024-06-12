library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;

entity muxM is 
  port(pet_L2_fallo: in tp_cntl_L2_s;
       pet_L2_exp: in tp_cntl_L2_s;
		 pet_L2_ini: tp_cntl_L2_s;
		 concesion_arb: in tp_arb_resp;
		 pet_L2_s: out tp_cntl_L2_s);
end muxM;

architecture comportamiento of muxM is 

signal acceso, pet, esc: std_logic;
signal id: integer;

begin 
-- Multiplexor que selecciona que peticion se ha de enviar a L2. Pt, PtxL, PtX o la peticion de Inicio
-- Las operaciones logicas usadas comprueban que realmente se concede el acceso al canal de peticiones de L2 cuando tienes una peticion valida pendiente
acceso <= (concesion_arb.conc_fallo_arb and pet_L2_fallo.l2_acc) or (concesion_arb.conc_exp_arb and pet_L2_exp.l2_acc) or (concesion_arb.forzar_exp and pet_L2_exp.l2_acc);
pet <= pet_L2_fallo.l2_pet or pet_L2_exp.l2_pet;
esc <= (concesion_arb.conc_exp_arb and pet_L2_exp.l2_esc) or (concesion_arb.forzar_exp and pet_L2_exp.l2_esc);
id <= pet_L2_fallo.identificador when (concesion_arb.conc_fallo_arb = '1') else -1; -- Si se trata de una peticion de expulsion, se marca con un -1

pet_L2_s <= (l2_acc => acceso or pet_L2_ini.l2_ini,
             l2_pet => pet, 
				 l2_esc => esc or pet_L2_ini.l2_ini,
				 l2_exp => pet_L2_exp.l2_exp,
				 l2_ini => pet_L2_ini.l2_ini,
				 identificador => id);
				
end comportamiento;