library ieee;
use ieee.std_logic_1164.all;

use work.componentes_adicionales_bus_pkg.all;

entity mod_L2_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_L2: in std_logic;
		 lista: in std_logic;
		 ocupada_L2: out std_logic);
end entity;

architecture comportamiento of mod_L2_lista is 

signal ocupada_L2_inter: std_logic;
signal valor_guardar: std_logic;

begin

-- Multiplexor asociado
mux: Mux2 port map(pet_L2 => pet_L2, fin_trans => lista, sel => ocupada_L2_inter, salida => valor_guardar);

-- Registro para mantener el nivel de la señal L2_lista
reg: registro_L2_lista port map(reloj => reloj, pcero => pcero, entrada => valor_guardar, salida => ocupada_L2_inter); 

ocupada_L2 <= ocupada_L2_inter;

end comportamiento;