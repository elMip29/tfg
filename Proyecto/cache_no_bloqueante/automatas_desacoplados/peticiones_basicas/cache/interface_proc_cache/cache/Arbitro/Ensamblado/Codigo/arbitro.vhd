library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.componentes_arbitro_pkg.all;

entity arbitro is 
   port(pet_fallo: in std_logic;
	     pet_fallo_exp: in std_logic;
		  pet_bex: in std_logic;
		  pet_rec_fallo: in std_logic;
		  pet_rec_acceso: in std_logic;
		  mem_ocupada: in std_logic;
		  bex_val: in std_logic;
		  bex_depen: in std_logic;
		  final_contador: in std_logic;
		  conc_arb_bus: out tp_arb_resp;
		  conc_arb_recursos: out tp_arb_resp_recursos);
end entity;

architecture estructural of arbitro is 

signal forzar_exp_inter, conc_fallo_inter, conc_exp_inter: std_logic;
signal conc_rec_fallo_inter, conc_rec_acceso_inter: std_logic;

begin 

-- Gestion del acceso al bus --
arbitro_bus: gestor_bus port map(pet_fallo => pet_fallo, pet_fallo_exp => pet_fallo_exp, pet_bex => pet_bex, mem_ocupada => mem_ocupada, 
                                 bex_val => bex_val, bex_depen => bex_depen, final_contador => final_contador, forzar_exp => forzar_exp_inter,
											conc_fallo => conc_fallo_inter, conc_exp => conc_exp_inter);
											
-- Gestion del acceso al camino --
arbitro_recursos: gestor_camino port map(pet_rec_fallo => pet_rec_fallo, pet_rec_acceso => pet_rec_acceso, conc_rec_fallo => conc_rec_fallo_inter, 
                                         conc_rec_acceso => conc_rec_acceso_inter);
													  
-- Salidas --
conc_arb_bus <= (conc_fallo_arb => conc_fallo_inter,
                 conc_exp_arb => conc_exp_inter,
					  forzar_exp => forzar_exp_inter);
					  
conc_arb_recursos <= (conc_recursos_acceso => conc_rec_acceso_inter,
                      conc_recursos_fallo => conc_rec_fallo_inter);

end estructural;