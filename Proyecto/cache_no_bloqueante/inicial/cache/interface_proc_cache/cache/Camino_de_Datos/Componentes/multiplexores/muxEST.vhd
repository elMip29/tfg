library ieee;
use ieee.std_logic_1164.all;

use work.campo_EST_pkg.all;

entity muxEST is 
  port(EST_e: in tp_est_e;
       EST_e_fallo: in tp_est_e;
		 sel: in std_logic;
		 EST_salida: out tp_est_e);
end entity;

architecture comportamiento of muxEST is 

begin 

EST_salida <= EST_e when sel = '0' else EST_e_fallo;

end comportamiento;