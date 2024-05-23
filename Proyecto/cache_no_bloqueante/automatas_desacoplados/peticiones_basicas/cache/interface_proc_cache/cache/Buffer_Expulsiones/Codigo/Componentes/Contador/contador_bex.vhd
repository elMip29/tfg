library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.param_disenyo_pkg.all;
use work.componentes_contador_bex_pkg.all;

entity contador_bex is   
   port(reloj: in std_logic;
	     pcero: in std_logic;
	     bex_val: in std_logic;
		  final: out std_logic);
end entity;

architecture estructural of contador_bex is 

signal bex_counter: tam_contador_bex := (others => '0');
signal contador, bex_counter_act, entrada_reg: tam_contador_bex;
signal final_inter: std_logic;

begin

-- Registro para almacenar el valor del contador --
registro_contador: reg_counter port map(reloj => reloj, pcero => pcero, entrada => entrada_reg, salida => bex_counter);

-- Multiplexor que depende de la señal valida del BEX --
MuxValBex: mux_bex_val port map(contador_e => contador, bex_val_sel => bex_val, salida => entrada_reg);

-- Multiplexor que permite mantener el nivel de la senyal final -- 
MuxFinalCont: mux_fin_cont port map(entrada_reg => bex_counter, contador_act => bex_counter_act, final => final_inter, salida => contador); 

-- Actualizacion del contador y comparacion con el valor maximo --
bex_counter_act <= bex_counter + 1;
final_inter <= '1' when (MAX_COUNT_BEX = bex_counter_act) else '0';
final <= final_inter;

end estructural;