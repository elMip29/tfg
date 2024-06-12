library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity gestor_bus is 
   port(pet_fallo: in std_logic;
	     pet_fallo_exp: in std_logic;
		  pet_bex: in std_logic;
		  L2_ocupada: in std_logic;
		  bex_val: in std_logic;
		  bex_depen: in std_logic;
		  final_contador: in std_logic;
		  forzar_exp: out std_logic;
		  conc_fallo: out std_logic;
		  conc_exp: out std_logic);
end entity;

architecture comportamiento of gestor_bus is 

signal forzar_exp_inter: std_logic;
signal conc_fallo_inter: std_logic;
signal conc_exp_inter: std_logic;

begin 

forzar_exp_inter <= ((bex_val and pet_fallo_exp) and pet_fallo) or bex_depen or final_contador;
conc_fallo_inter <= (pet_fallo and (not forzar_exp_inter)); 
conc_exp_inter <= (pet_bex and (not conc_fallo_inter));

forzar_exp <= forzar_exp_inter;
conc_fallo <= conc_fallo_inter and (not L2_ocupada);
conc_exp <= conc_exp_inter and (not L2_ocupada);

end comportamiento;