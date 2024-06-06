library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interface_L1_L2_pkg.all;

entity interface_L1_L2 is
	port(reloj: in std_logic;
	     pcero: in std_logic;
		  pet_L1: in tp_peticion_L2;
		  pet_cache_listo: in std_logic;
		  pet_listo: out std_logic;
		  peticion: out tp_peticion_L2);
end interface_L1_L2;

architecture estructural of interface_L1_L2 is

signal reg_pet: tp_peticion_L2;
signal pe: std_logic;

begin

pe <= pet_cache_listo and pet_L1.acc;
regpet_L2: registro_pet_L2 port map (reloj => reloj, pe => pe, e => pet_L1, s => reg_pet);

muxpet_L2: mux_pet_L2 port map (a => reg_pet, b => pet_L1, sel => pet_cache_listo, s => peticion);
pet_listo <= pet_cache_listo;

end estructural;