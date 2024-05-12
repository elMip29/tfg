library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package peticiones_cache_pkg is

-- Peticiones y Respuestas --
type tp_peticion is record
    acc: std_logic;
    dir: st_dir;
    pe: std_logic;
	 ini: std_logic;
    dato_escribir: st_palabra_dat;
	 identificador: integer;
end record;

type tp_respuesta is record
    dato_leido: st_palabra_dat;
    valido: std_logic;
	 identificador: integer;
end record;

-- Peticiones y Respuestas por el Bus --
type tp_peticion_control is record
    m_pet: std_logic;
    m_pe: std_logic;
end record;

type tp_respuesta_control is record 
    m_val: std_logic;
	 LE_mem: std_logic;
end record;

type tp_peticion_datos is record
    dir: st_dir_bloque;
    dato_escribir: st_bloque_dat;
end record;

type tp_respuesta_datos is record 
    m_dato: st_bloque_dat;
	 identificador: integer;
end record;

type tp_peticion_mem is record
	m_pet: std_logic;
	m_esc: std_logic;
	m_dir: st_dir_bloque;
   m_DE : st_bloque_dat;	
	identificador: integer;
end record;

end package peticiones_cache_pkg;

