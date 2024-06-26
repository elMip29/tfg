library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;
use work.retardos_pkg.all;

entity memoria_DAT_L2 is 
  port(reloj: in std_logic;
	    DAT_e: in tp_mem_dat_e_L2;
		 DL: out st_bloque_dat);
end entity;

architecture comportamiento of memoria_DAT_L2 is 
signal indice: numero_contenedores_L2;
signal campo_datos: tp_m_DAT_L2;

begin

indice <= to_integer(unsigned(DAT_e.dir)) after ret_deco_dat;

process(reloj)
begin
   if (rising_edge(reloj)) then 
	    if (DAT_e.acc = '1') then 
		     if (DAT_e.esc = '1') then 
			      campo_datos(indice) <= DAT_e.DE after ret_dat_esc;
			  end if;
			  DL <= campo_datos(indice) after ret_dat_leer;
		 end if;
	end if;
end process;

end comportamiento;