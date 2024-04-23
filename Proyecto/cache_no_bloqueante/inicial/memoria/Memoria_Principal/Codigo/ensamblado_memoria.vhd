library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_memoria_pkg.all;

entity ensamblado_memoria is 
   port(reloj: in std_logic;
	     dir: in st_dir_bloque;
		  m_pet_val: in std_logic;
		  m_pe: in std_logic;
		  dato_escribir: in st_bloque_dat;
		  lec: out std_logic;
		  m_resp_val: out std_logic;
		  dato_leido: out st_bloque_dat);
end ensamblado_memoria;

architecture estructural of ensamblado_memoria is 

signal reg_controlador_val: std_logic;

begin

-- registro asociado al Controlador Memoria 
registro_controlador: Reg_ControladorMem port map(reloj => reloj, entrada => m_pet_val, salida => reg_controlador_val);

-- Controlador de Memoria
controlador: controlador_mem port map(m_pet_val => reg_controlador_val, m_pe => m_pe, lec => lec, m_resp_val => m_resp_val);

-- Memoria 
memoria: memory port map(reloj => reloj, m_peticion => m_pet_val, dir => dir, m_pe => m_pe, 
                         dato_escribir => dato_escribir, dato_leido => dato_leido);

end;