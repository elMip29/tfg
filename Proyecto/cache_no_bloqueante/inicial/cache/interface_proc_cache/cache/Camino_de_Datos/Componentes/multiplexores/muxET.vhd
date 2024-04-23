library ieee;
use ieee.std_logic_1164.all;

use work.campo_ET_pkg.all;

entity muxET is 
  port(ET_e: in tp_etiq_e;
       ET_e_fallo: in tp_etiq_e;
		 sel: in std_logic;
		 ET_salida: out tp_etiq_e);
end entity;

architecture comportamiento of muxET is 

begin 

ET_salida <= ET_e when sel = '0' else ET_e_fallo;

end comportamiento;