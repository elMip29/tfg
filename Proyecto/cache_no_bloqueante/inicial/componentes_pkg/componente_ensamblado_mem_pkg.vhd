library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componente_ensamblado_mem_pkg is

component ensamblado_memoria is 
  port(reloj: in std_logic;
       dir: st_dir_bloque;
		 m_pet_val: in std_logic;
		 m_pe: in std_logic;
		 dato_escribir: in st_bloque_dat;
		 lec: out std_logic;
		 m_resp_val: out std_logic;
		 dato_leido: out st_bloque_dat);
end component;

end package componente_ensamblado_mem_pkg;
