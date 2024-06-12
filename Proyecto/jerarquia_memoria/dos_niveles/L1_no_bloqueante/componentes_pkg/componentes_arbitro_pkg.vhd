library ieee;
use ieee.std_logic_1164.all;

package componentes_arbitro_pkg is 

component gestor_bus is 
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
end component;

component gestor_camino is 
  port(pet_rec_fallo: in std_logic; 
	    pet_rec_acceso: in std_logic;
		 conc_rec_fallo: out std_logic; 
		 conc_rec_acceso: out std_logic);
end component;


end componentes_arbitro_pkg;