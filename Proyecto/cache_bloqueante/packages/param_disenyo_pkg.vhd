library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package param_disenyo_pkg is


-- Direccion --
constant dir_bits: natural:= 16;
subtype st_dir is std_logic_vector(dir_bits - 1 downto 0);

-- Bloque de datos --
constant tam_bytes_bits: natural:= 8;
constant tam_palabra_bytes: natural:= 1;
constant num_palabras_bloque: natural:= 2;
constant tam_bloque_bytes: natural:= tam_palabra_bytes * num_palabras_bloque;
constant tam_palabra_bits: natural:= tam_palabra_bytes * tam_bytes_bits;
constant tam_bloque_bits: natural:= tam_bytes_bits * tam_bloque_bytes;

subtype st_palabra is std_logic_vector(tam_palabra_bits - 1 downto 0);
subtype st_bloque is std_logic_vector(tam_bloque_bits - 1 downto 0);

-- Parametros Cache L1 --
constant num_contenedores: natural:= 4;

constant block_offset_bits: natural:= natural((log2(real(tam_bloque_bytes))));
constant indice_bits: natural:= natural((log2(real(num_contenedores))));
constant etiqueta_bits: natural:= (dir_bits - indice_bits) - block_offset_bits;

subtype st_block_offset is std_logic_vector(block_offset_bits - 1 downto 0);
subtype st_indice is std_logic_vector(indice_bits - 1 downto 0);
subtype st_etiqueta is std_logic_vector(etiqueta_bits - 1 downto 0);

-- Memoria --
constant tam_EspacioLogico: integer:= 2**dir_bits;
type RAM_mem is array(0 to tam_EspacioLogico - 1) of st_bloque;

end package param_disenyo_pkg;


