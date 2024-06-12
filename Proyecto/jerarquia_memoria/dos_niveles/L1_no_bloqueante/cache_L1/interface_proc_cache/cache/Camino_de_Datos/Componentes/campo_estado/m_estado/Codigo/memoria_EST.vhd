library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_EST_pkg.all;
use work.retardos_pkg.all;

entity memoria_EST is 
  port(reloj: in std_logic;
	    EST_e: in tp_est_e;
		 DL: out st_estado);
end entity;

architecture comportamiento of memoria_EST is 

signal indice: numero_contenedores;
signal campo_estado: tp_m_EST;

begin

indice <= to_integer(unsigned(EST_e.dir)) after ret_deco_estado;

process(reloj)
begin
   if (rising_edge(reloj)) then 
	    if (EST_e.acc = '1') then 
		     if (EST_e.esc = '1') then 
			      campo_estado(indice)(1 downto 0) <= EST_e.DE(1 downto 0) after ret_estado_esc;
			  end if;
			  if (EST_e.esc_ocupado = '1') then -- Se trata por separado el bit de contenedor ocupado de los bits de estado. Requiere un permiso de escritura propio
			      campo_estado(indice)(2) <= EST_e.DE(2) after ret_estado_esc;
			  end if;
			  DL <= campo_estado(indice) after ret_estado_leer;
		 end if;
	end if;
end process;

end comportamiento;
