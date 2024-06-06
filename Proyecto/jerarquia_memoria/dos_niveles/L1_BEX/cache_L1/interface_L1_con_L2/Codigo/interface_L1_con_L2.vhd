library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.peticiones_cache_pkg.all;
use work.controlador_pkg.all;
use work.componentes_inteface_L1_con_L2_pkg.all;

entity interface_L1_con_L2 is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
		  pet_proc: in tp_peticion;
		  resp_L2: in tp_respuesta_L2;
		  L2_lista: in std_logic;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta;
		  pet_L2: out tp_peticion_L2);
end interface_L1_con_L2;

architecture estructural of interface_L1_con_L2 is

signal pet_L2_inter: tp_peticion_L2;
signal resp_recibida_L2: tp_respuesta_L2;

signal resp_recibida_inter: std_logic;
signal L2_bloque: st_bloque_dat;

begin

-- Interconexion --
resp_recibida_inter <= resp_recibida_L2.valido;
L2_bloque <= resp_recibida_L2.bloque_leido;

-- cache con interfaces con el procesador 
cach_L1: cache_con_interface_proc port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, resp_L2 => resp_recibida_inter, L2_lista => L2_lista,
                                           L2_bloque => L2_bloque, pet_listo => pet_listo, resp_cache => resp_cache, pet_L2 => pet_L2_inter); 

-- Canal de peticiones a la cache L2
inter_L1_L2_peticiones: interface_L1_L2_pet port map(pet_a_L2 => pet_L2_inter, pet_enviada => pet_L2);

-- Canal de respuestas de la cache L2
inter_L1_L2_respuestas: interface_L1_L2_resp port map(respuesta => resp_L2, resp_recibida => resp_recibida_L2);

end estructural;