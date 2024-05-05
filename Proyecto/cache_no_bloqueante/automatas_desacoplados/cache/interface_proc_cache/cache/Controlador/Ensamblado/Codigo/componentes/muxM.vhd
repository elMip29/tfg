library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;

entity muxM is 
  port(pet_m_fallo: in tp_cntl_memoria_s;
       pet_m_exp: in tp_cntl_memoria_s;
		 concesion_arb: in tp_arb_resp;
		 pet_m_s: out tp_cntl_memoria_s);
end muxM;

architecture comportamiento of muxM is 

signal acceso, pet, esc: std_logic;

begin 

acceso <= (concesion_arb.conc_fallo_arb and pet_m_fallo.m_acc) or (concesion_arb.conc_exp_arb and pet_m_exp.m_acc) or (concesion_arb.forzar_exp and pet_m_exp.m_acc);
pet <= pet_m_fallo.m_pet or pet_m_exp.m_pet;
esc <= not(concesion_arb.conc_fallo_arb and (not pet_m_fallo.m_esc)) or (concesion_arb.conc_exp_arb and pet_m_exp.m_esc) or (concesion_arb.forzar_exp and pet_m_exp.m_esc) ;

pet_m_s <= (m_acc => acceso,
            m_pet => pet, 
				m_esc => esc);
				
end comportamiento;