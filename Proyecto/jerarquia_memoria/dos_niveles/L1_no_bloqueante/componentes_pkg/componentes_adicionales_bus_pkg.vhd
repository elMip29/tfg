library ieee;
use ieee.std_logic_1164.all;

package componentes_adicionales_bus_pkg is 

component Mux2 is 
  port(pet_L2: in std_logic;
       fin_trans: in std_logic;
		 sel: in std_logic;
		 salida: out std_logic);
end component;

component registro_L2_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 entrada: in std_logic;
		 salida: out std_logic);
end component;

end package componentes_adicionales_bus_pkg;