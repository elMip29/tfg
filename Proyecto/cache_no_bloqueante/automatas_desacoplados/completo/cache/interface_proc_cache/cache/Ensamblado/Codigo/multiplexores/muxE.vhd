library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity muxE is      
 port(dir_bloque_proc: in st_dir_bloque;
      dir_bloque_exp: in st_dir_bloque;
		sel_FALLO: in std_logic;
		sel_EXP: in std_logic;
		salida: out st_dir_bloque);
end muxE;

architecture compor of muxE is  

signal sv_FALLO: st_dir_bloque;
signal sv_EXP: st_dir_bloque;

signal and_FALLO: st_dir_bloque;
signal and_EXP: st_dir_bloque;

begin

sv_FALLO <= (others => sel_FALLO);
sv_EXP <= (others => sel_EXP);

and_FALLO <= dir_bloque_proc and sv_FALLO;
and_EXP <= dir_bloque_exp and sv_EXP;

salida <= and_FALLO or and_EXP;
	  
end compor;