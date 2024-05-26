library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interface_proc_cache_pkg.all;

entity interface_L1_L2 is
	port(reloj: in std_logic;
	     pcero: in std_logic;
		  pet_L1: in tp_peticion;
		  pet_cache_listo: in std_logic;
		  pet_listo: out std_logic;
		  peticion: out tp_peticion);
end interface_L1_L2;

architecture estructural of interface_L1_L2 is

signal reg_pet: tp_peticion;
signal pe: std_logic;

begin

pe <= pet_cache_listo and pet_L1.acc;
regpet: registro_pet port map (reloj => reloj, pe => pe, e => pet_L1, s => reg_pet);

muxpet: mux_pet port map (a => reg_pet, b => pet_L1, sel => pet_cache_listo, s => peticion);
pet_listo <= pet_cache_listo;

end estructural;