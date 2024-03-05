library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package param_disenyo_pkg is

-- Camino de datos
constant dato_bits: natural:= 8;
subtype st_dato is std_logic_vector(dato_bits-1 downto 0);

-- Direccion --
constant dir_bits: natural:= 16;
subtype st_dir is std_logic_vector(dir_bits - 1 downto 0);

-- Bloque de datos --
constant tam_bytes_bits: natural:= 8;
constant tam_palabra_bytes: natural:= 1;
constant num_palabras_bloque: natural:= 2;
constant tam_bloque_bytes: natural:= num_palabras_bloque * tam_palabra_bytes;
constant tam_palabra_bits: natural:= tam_palabra_bytes * tam_bytes_bits;
constant tam_bloque_bits: natural:= tam_bytes_bits * tam_bloque_bytes;

constant dir_byte_palabra_bits: natural := natural(log2(real(tam_palabra_bytes))); -- Numero de bits para identificar los bytes de una palabra
constant dir_mod_bloque_bits: natural := natural(log2(real(tam_bloque_bytes))); -- Numero de bits para identificar los bytes de un bloque
constant dir_palabra_bloq_bits: natural := dir_mod_bloque_bits - dir_byte_palabra_bits; -- Numero de bits para identificar la palabra en un bloque
constant dir_bloque_bits: natural:= dir_bits - dir_mod_bloque_bits; -- Numero de bits en la direccion de un bloque

-- bit mas significativo (mas uno) de las palabras de un bloque --
constant primera_pala: natural:= tam_palabra_bits;
constant segunda_pala: natural:= tam_palabra_bits * num_palabras_bloque;

-- Parametros Cache L1 --
subtype st_elem_dat is std_logic_vector(tam_bytes_bits-1 downto 0);
subtype st_palabra_dat is std_logic_vector(tam_palabra_bits-1 downto 0);
subtype st_bloque_dat is std_logic_vector(tam_bloque_bits-1 downto 0);
subtype st_bloque_esc is std_logic_vector(num_palabras_bloque-1 downto 0);

constant num_conjuntos: natural:= 8;
constant num_elem_conjunto: natural:= 1;
constant num_contenedores: natural:= num_conjuntos * num_elem_conjunto;
constant log_num_conjuntos: natural := natural(log2(real(num_conjuntos)));

constant indice_bits: natural:= natural(log2(real(num_conjuntos)));
constant elem_conjunto_bits: natural:= natural(log2(real(num_elem_conjunto)));
constant etiq_bits: natural:= dir_bloque_bits - indice_bits;

subtype st_etiqueta is std_logic_vector(etiq_bits-1 downto 0); 
subtype st_dir_conjunto is std_logic_vector(indice_bits-1 downto 0);
subtype st_dir_bloque is std_logic_vector(etiq_bits+indice_bits-1 downto 0);

-- bits mas significativo (mas uno) y menos significativo de los campos etiquetas (et) y conjunto (cj)
constant bitMAS_et: natural:= dir_bloque_bits;
constant bitMEN_et: natural:= bitMAS_et-etiq_bits;

constant bitMAS_cj: natural:= bitMEN_et;
constant bitMEN_cj: natural:= bitMAS_cj-indice_bits;

constant num_estado: natural:= 3;
constant bits_estado: natural:= natural(ceil(log2(real(num_estado))));
subtype st_estado is std_logic_vector(bits_estado - 1 downto 0);

subtype st_cache_dat is std_logic_vector(tam_bloque_bits-1 downto 0);

--constant num_contenedores: natural:= 4;

--constant block_offset_bits: natural:= natural((log2(real(tam_bloque_bytes))));
--constant indice_bits: natural:= natural((log2(real(num_contenedores))));
--constant etiqueta_bits: natural:= (dir_bits - indice_bits) - block_offset_bits;

--subtype st_block_offset is std_logic_vector(block_offset_bits - 1 downto 0);
--subtype st_indice is std_logic_vector(indice_bits - 1 downto 0);
--subtype st_etiqueta is std_logic_vector(etiqueta_bits - 1 downto 0);

-- Memoria --
constant tam_EspacioLogico: integer:= 2**dir_bits;
type RAM_mem is array(0 to tam_EspacioLogico - 1) of st_bloque_dat;

subtype numero_contenedores is natural range 0 to num_conjuntos - 1;
type tp_m_ET is array (numero_contenedores) of st_etiqueta;
type tp_m_EST is array (numero_contenedores) of st_estado;
type tp_m_DAT is array (numero_contenedores) of st_bloque_dat;


end package param_disenyo_pkg;


