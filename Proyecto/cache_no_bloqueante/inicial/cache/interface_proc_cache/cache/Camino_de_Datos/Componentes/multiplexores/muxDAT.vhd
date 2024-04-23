library ieee;
use ieee.std_logic_1164.all;

use work.campo_DAT_pkg.all;

entity muxDAT is 
  port(DAT_e: in tp_datos_e;
       DAT_e_fallo: in tp_datos_e;
		 sel: in std_logic;
		 DAT_salida: out tp_datos_e);
end entity;

architecture comportamiento of muxDAT is 

begin 

DAT_salida <= DAT_e when sel = '0' else DAT_e_fallo;

end comportamiento;