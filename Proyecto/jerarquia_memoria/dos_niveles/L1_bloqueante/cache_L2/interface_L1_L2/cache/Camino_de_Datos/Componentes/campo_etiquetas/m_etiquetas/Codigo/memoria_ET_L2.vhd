library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.retardos_pkg.all;

entity memoria_ET_L2 is 
  port(reloj: in std_logic;
	    ET_e: in tp_memoria_et_e_L2;
		 DL: out st_etiqueta_L2);
end entity;

architecture comportamiento of memoria_ET_L2 is 
signal indice: numero_contenedores_L2;
signal campo_etiquetas: tp_m_ET_L2;

begin

indice <= to_integer(unsigned(ET_e.dir)) after ret_deco_etiq;

process(reloj)
begin
   if (rising_edge(reloj)) then 
	    if (ET_e.acc = '1') then 
		     if (ET_e.pe = '1') then 
			      campo_etiquetas(indice) <= ET_e.DE after ret_etiq_esc;
			  end if;
			  DL <= campo_etiquetas(indice) after ret_etiq_leer;
		 end if;
	end if;
end process;

end comportamiento;

