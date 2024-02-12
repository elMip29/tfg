library ieee;
use ieee.std_logic_1164.all;

package retardos_pkg is

-- Registro Desacoplo
constant retREGDES: time := 2 ns; 

-- Controlador Cache
constant retardo_estado: time := 2 ns;
constant retardo_logica_prx_estado: time := 2 ns;
constant retardo_logica_salida: time := 3 ns;

-- Memorias
constant ret_etiq_esc: time := 2 ns;
constant ret_etiq_leer: time := 3 ns;
constant ret_deco_etiq: time := 2 ns;

constant ret_dat_esc: time := 2 ns;
constant ret_dat_leer: time := 3 ns;
constant ret_deco_dat: time := 2 ns;

constant ret_estado_esc: time := 1 ns;
constant ret_estado_leer: time := 1 ns;
constant ret_deco_estado: time := 1 ns;

constant ret_mem: time := 8 ns;
constant ret_deco_mem: time := 3 ns;
constant retcnt_mem: time := 1 ns;

end retardos_pkg;