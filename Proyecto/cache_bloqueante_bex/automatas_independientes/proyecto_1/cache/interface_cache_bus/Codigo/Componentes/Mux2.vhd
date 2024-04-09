library ieee;
use ieee.std_logic_1164.all;

entity Mux2 is 
  port(pet_m: in std_logic;
       fin_trans: in std_logic;
		 sel: in std_logic;
		 salida: out std_logic);
end entity;

architecture comportamiento of Mux2 is 

begin

salida <= fin_trans when sel = '1' else pet_m; 

end comportamiento;