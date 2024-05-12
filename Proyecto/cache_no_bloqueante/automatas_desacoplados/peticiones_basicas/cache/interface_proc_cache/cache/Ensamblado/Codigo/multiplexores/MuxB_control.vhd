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
-- Circuito para generar la senyal de control para el MuxB, por defecto se seleciona la entrada 0 --
--entrada_0 <= not(conc_fallo_recursos or conc_acceso_recursos);
entrada_0 <= conc_fallo_recursos and (not conc_acceso_recursos);
sel_MuxB <= muxB_interno and entrada_0; -- La senyal muxB_interno es una senyal interna del controlador de fallo, que se activa cuando es necesario
                                        -- recoger el bloque del buffer de carga
--sel_MuxB <= muxB_interno or entrada_0; 
end comportamiento;