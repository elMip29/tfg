library ieee;
use ieee.std_logic_1164.all;

entity MuxB_control is 
  port(conc_fallo_recursos: in std_logic; 
       conc_acceso_recursos: in std_logic;
	    muxB_interno: in std_logic;
	    sel_MuxB: out std_logic);	 
end entity;

architecture comportamiento of MuxB_control is 

signal entrada_0: std_logic;

begin 

entrada_0 <= not(conc_fallo_recursos or conc_acceso_recursos);

sel_MuxB <= muxB_interno or entrada_0; -- La logica usada para la seleccion de la entrada 0 provoca que por defecto se seleccione la entrada 1 del muxB

end comportamiento;