library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_memoria_pkg is

component controlador_mem is
    port(m_pet_val: in std_logic;
	      m_pe: in std_logic;
			LE: out std_logic;
	      m_resp_val: out std_logic);
end component;

component memory is
    port(reloj: in std_logic;
	      m_peticion: in std_logic;
		   dir: in st_dir_bloque;
		   m_pe: in std_logic;
		   dato_escribir: in st_bloque_dat;
		   dato_leido: out st_bloque_dat);
end component;

component Reg_ControladorMem is
    port(reloj: in std_logic;
	      entrada: in std_logic;
		   salida: out std_logic);
end component;

end package componentes_memoria_pkg;
