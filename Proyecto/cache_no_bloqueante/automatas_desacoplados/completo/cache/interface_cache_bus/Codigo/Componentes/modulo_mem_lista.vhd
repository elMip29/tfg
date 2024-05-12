library ieee;
use ieee.std_logic_1164.all;

use work.componentes_adicionales_bus_pkg.all;

entity mem_lista is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 m_pet: in std_logic;
		 m_val: in std_logic;
		 ocupada_mem: out std_logic);
end entity;

architecture comportamiento of mem_lista is 

signal fin_trans: std_logic;
signal ocupada_mem_inter: std_logic;
signal valor_guardar: std_logic;

begin

fin_trans <= not m_val;

-- Multiplexor asociado
mux: Mux2 port map(pet_m => m_pet, fin_trans => fin_trans, sel => ocupada_mem_inter, salida => valor_guardar);

-- Registro para mantener el nivel de la señal m_val
reg: registro_mem_lista port map(reloj => reloj, pcero => pcero, entrada => valor_guardar, salida => ocupada_mem_inter); 

ocupada_mem <= ocupada_mem_inter;

end comportamiento;