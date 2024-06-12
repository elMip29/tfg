library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

entity interface_L1_L2_pet is -- Componente sencillo que identifica el canal de peticiones de L1 a L2
  port(pet_a_L2: in tp_peticion_L2;
       pet_enviada: out tp_peticion_l2);
end entity;

architecture comportamiento of interface_L1_L2_pet is

begin

pet_enviada <= pet_a_L2;

end comportamiento;