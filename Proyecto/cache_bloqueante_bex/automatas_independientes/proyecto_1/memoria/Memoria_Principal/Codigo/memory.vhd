library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity memory is
   port(reloj: in std_logic;
	     m_peticion: in std_logic;
		  dir: in st_dir_bloque;
		  m_pe: in std_logic;
		  dato_escribir: in st_bloque_dat;
		  dato_leido: out st_bloque_dat);
end memory;

architecture comportamiento of memory is

signal indice: integer;
signal memoria: RAM_mem;

begin
indice <= to_integer(unsigned(dir)) after ret_deco_mem;

process(reloj)
begin 
     if (rising_edge(reloj)) then 
	     if (m_peticion = '1') then 
		     if (m_pe = '1') then 
			     memoria(indice) <= dato_escribir after ret_mem;
			  end if;
			  dato_leido <= memoria(indice) after ret_mem;
		  end if;
	  end if;
end process;

end comportamiento;
	     