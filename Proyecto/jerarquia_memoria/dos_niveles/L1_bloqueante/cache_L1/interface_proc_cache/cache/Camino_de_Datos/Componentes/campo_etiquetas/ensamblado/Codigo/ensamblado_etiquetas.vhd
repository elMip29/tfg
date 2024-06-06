library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.componente_etiq_pkg.all; 

entity ensamblado_etiquetas is 
   port(reloj: in std_logic; 
	     etiq_entrada: in tp_etiq_e;
		  DL: out st_etiqueta;
		  AF: out std_logic);
end entity;

architecture estructura of ensamblado_etiquetas is 

signal ET_e_inter: tp_memoria_et_e;
signal DL_inter: st_etiqueta;

begin 

memoria_etiquetas: memoria_ET port map(reloj => reloj, ET_e => ET_e_inter, DL => DL_inter);

-- Entrada a la memoria de etiquetas --
ET_e_inter <= (acc => etiq_entrada.acc, 
               dir => etiq_entrada.dirB(bitMAS_cj - 1 downto bitMEN_cj),
					pe => etiq_entrada.esc,
					DE => etiq_entrada.dirB(bitMAS_et - 1 downto bitMEN_et));


-- Comparación etiquetas --
AF <= '1' when (DL_inter = etiq_entrada.dirB(bitMAS_et - 1 downto bitMEN_et)) else '0';
					
-- Salida etiqueta --
DL <= DL_inter;

end;