library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.componente_etiq_pkg.all; 

entity ensamblado_etiquetas_L2 is 
   port(reloj: in std_logic; 
	     etiq_entrada: in tp_etiq_e;
		  DL: out st_etiqueta_L2;
		  AF: out std_logic);
end entity;

architecture estructura of ensamblado_etiquetas_L2 is 

signal ET_e_inter: tp_memoria_et_e_L2;
signal DL_inter: st_etiqueta_L2;

begin 

memoria_etiquetas: memoria_ET_L2 port map(reloj => reloj, ET_e => ET_e_inter, DL => DL_inter);

-- Entrada a la memoria de etiquetas --
ET_e_inter <= (acc => etiq_entrada.acc, 
               dir => etiq_entrada.dirB(bitMAS_cj_L2 - 1 downto bitMEN_cj_L2),
					pe => etiq_entrada.esc,
					DE => etiq_entrada.dirB(bitMAS_et_L2 - 1 downto bitMEN_et_L2));


-- Comparación etiquetas --
AF <= '1' when (DL_inter = etiq_entrada.dirB(bitMAS_et_L2 - 1 downto bitMEN_et_L2)) else '0';
					
-- Salida etiqueta --
DL <= DL_inter;

end estructura;