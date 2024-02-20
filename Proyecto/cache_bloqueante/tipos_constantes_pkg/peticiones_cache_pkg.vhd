library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package peticiones_cache_pkg is

-- Peticiones y Respuestas --
type tp_peticion is record
    acc: std_logic;
    dir: st_dir;
    pe: std_logic;
    dato_escribir: st_palabra;
end record;

type tp_respuesta is record
    dato_leido: st_palabra;
    val: std_logic;
end record;

-- Peticiones y Respuestas por el Bus --
type tp_peticion_control is record
    m_pet: std_logic;
    m_pe: std_logic;
end record;

type tp_respuesta_control is record 
    m_val: std_logic;
end record;

type tp_peticion_datos is record
    dir: st_dir;
    dato_escribir: st_bloque;
end record;

type tp_respuesta_datos is record 
    m_dato: st_bloque;
end record;

end package peticiones_cache_pkg;

