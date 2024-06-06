library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;
use work.retardos_pkg.all;

entity memoria_DAT is 
  port(reloj: in std_logic;
	    DAT_e: in tp_mem_dat_e;
		 DL: out st_bloque_dat);
end entity;

architecture comportamiento of memoria_DAT is 
signal indice: numero_contenedores;
signal campo_datos: tp_m_DAT;

begin

indice <= to_integer(unsigned(DAT_e.dir)) after ret_deco_dat;

process(reloj)
begin
   if (rising_edge(reloj)) then 
	    if (DAT_e.acc = '1') then 
		     if (DAT_e.esc(0) = '1') then 
			      campo_datos(indice)(7 downto 0) <= DAT_e.DE(7 downto 0) after ret_dat_esc;
			  end if;
			  if (DAT_e.esc(1) = '1') then 
			      campo_datos(indice)(15 downto 8) <= DAT_e.DE(15 downto 8) after ret_dat_esc;
			  end if;
			  DL <= campo_datos(indice) after ret_dat_leer;
		 end if;
	end if;
end process;

end comportamiento;