library ieee;
use ieee.std_logic_1164.all;

entity gestor_camino is 
  port(pet_rec_fallo: in std_logic; 
	    pet_rec_acceso: in std_logic;
		 conc_rec_fallo: out std_logic; 
		 conc_rec_acceso: out std_logic);
end entity;

architecture comportamiento of gestor_camino is 

begin

conc_rec_fallo <= pet_rec_fallo;
conc_rec_acceso <= pet_rec_acceso and (not pet_rec_fallo); -- Es prioritaria la concesion al fallo

end comportamiento;