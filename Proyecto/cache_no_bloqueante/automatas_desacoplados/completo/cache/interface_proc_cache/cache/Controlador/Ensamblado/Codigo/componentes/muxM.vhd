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
signal id: integer;

begin 
-- Multiplexor que selecciona entre la peticion de memoria de lectura y la peticion de expulsion del BEX
-- Las operaciones logicas usadas comprueban que realmente se concede el bus cuando tienes una peticion valida pendiente
acceso <= (concesion_arb.conc_fallo_arb and pet_m_fallo.m_acc) or (concesion_arb.conc_exp_arb and pet_m_exp.m_acc) or (concesion_arb.forzar_exp and pet_m_exp.m_acc);
pet <= pet_m_fallo.m_pet or pet_m_exp.m_pet;
esc <= not(concesion_arb.conc_fallo_arb and (not pet_m_fallo.m_esc)) or (concesion_arb.conc_exp_arb and pet_m_exp.m_esc) or (concesion_arb.forzar_exp and pet_m_exp.m_esc) ;
id <= pet_m_fallo.identificador when (concesion_arb.conc_fallo_arb = '1') else -1; -- Si se trata de una peticion de expulsion, se marca con un -1

pet_m_s <= (m_acc => acceso,
            m_pet => pet, 
				m_esc => esc,
				identificador => id);
				
end comportamiento;