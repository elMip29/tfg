library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.componentes_muxBDF_pkg.all;

entity ensamblado_muxBDF is 
   port(muxBDF_1: in std_logic; 
	     muxBDF_2: in std_logic; 
		  entrada_BDF: in tp_muxBDF_e; 
		  salida_BDF: out tp_muxBDF_s);
end entity;

architecture estructural of ensamblado_muxBDF is 

signal mux_bdf_control: std_logic;
signal dir_inter: st_dir;
signal dato_inter: st_palabra_dat;
signal DAT_palabra_esc_inter: std_logic;
signal DAT_bloque_esc_inter: std_logic;

begin 

mux_bdf_control <= muxBDF_1 or muxBDF_2; -- Por defecto la señal de control del muxBDF sera 0, seleccionado los datos del procesador 

-- Multiplexor para seleccionar la direccion del procesador o la direccion del Buffer de direccion de fallo --
muxBDF_dir: mux_bdf_dir port map(entrada_proc => entrada_BDF.dir_proc, entrada_bdf => entrada_BDF.dir_fallo, sel => mux_bdf_control, salida => dir_inter);

-- Multiplexor para seleccionar el dato del procesador o el dato del Buffer de direccion de fallo --
muxBDF_dato: mux_bdf_dat port map(entrada_proc => entrada_BDF.dato_proc, entrada_bdf => entrada_BDF.dato_fallo, sel => mux_bdf_control, salida => dato_inter);

-- Salida --
salida_BDF <= (dato_muxbdf => dato_inter, 
               dir_muxbdf => dir_inter);

end estructural;