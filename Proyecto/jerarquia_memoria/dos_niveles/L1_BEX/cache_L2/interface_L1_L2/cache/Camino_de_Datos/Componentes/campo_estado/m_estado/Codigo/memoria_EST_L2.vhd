library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_EST_pkg.all;
use work.retardos_pkg.all;

entity memoria_EST_L2 is 
  port(reloj: in std_logic;
	    EST_e: in tp_est_e_L2;
		 DL: out st_estado_L2);
end entity;

architecture comportamiento of memoria_EST_L2 is 

signal indice: numero_contenedores_L2;
signal campo_estado: tp_m_EST_L2;

begin

indice <= to_integer(unsigned(EST_e.dir)) after ret_deco_estado;

process(reloj)
begin
   if (rising_edge(reloj)) then 
	    if (EST_e.acc = '1') then 
		     if (EST_e.esc = '1') then 
			      campo_estado(indice) <= EST_e.DE after ret_estado_esc;
			  end if;
			  DL <= campo_estado(indice) after ret_estado_leer;
		 end if;
	end if;
end process;

end comportamiento;
