library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;
use work.componentes_interface_proc_cache_pkg.all;

entity interface_proc_cache is
	port(reloj: in std_logic;
	     pcero: in std_logic;
		  pet_proc: in tp_peticion;
		  pet_cache_listo: in std_logic;
		  pet_listo: out std_logic;
		  peticion: out tp_peticion);
end interface_proc_cache;

architecture estruc of interface_proc_cache is

signal reg_pet: tp_peticion;
signal pe: std_logic;

begin

pe <= pet_cache_listo and pet_proc.acc;
regpet: registro_pet port map (reloj => reloj, pe => pe, e => pet_proc, s => reg_pet);

muxpet: mux_pet port map (a => reg_pet, b => pet_proc, sel => pet_cache_listo, s => peticion);
pet_listo <= pet_cache_listo;

end;