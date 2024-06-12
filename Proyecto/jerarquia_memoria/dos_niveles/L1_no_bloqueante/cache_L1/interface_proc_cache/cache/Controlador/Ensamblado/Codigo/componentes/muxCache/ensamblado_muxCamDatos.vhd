library ieee;
use ieee.std_logic_1164.all;

use work.controlador_pkg.all;
use work.componentes_muxCamDatos_pkg.all;

entity ensamblado_muxCamDatos is
   port(entrada_acierto: in tp_contro_cam_acceso; 
	     entrada_fallo: in tp_contro_cam_fallo;
		  conc_arb_recursos: in tp_arb_resp_recursos;
	     control_ET: out tp_contro_ET; 
		  control_EST: out tp_contro_EST; 
		  control_DAT: out tp_contro_DAT);
end entity;

architecture estructural of ensamblado_muxCamDatos is 

signal muxControl: std_logic;

signal control_ET_a, control_ET_f: tp_contro_ET;
signal control_EST_a, control_EST_f: tp_contro_EST;
signal control_DAT_a, control_DAT_f: tp_contro_DAT;

begin 

-- Para las siguientes señales de control, por defecto se escoge la entrada 0 del multiplexor correspondiente (datos del procesador)
muxControl <= conc_arb_recursos.conc_recursos_fallo and (not conc_arb_recursos.conc_recursos_acceso);

-- Multiplexor Etiquetas --
control_ET_a <= (ET_acc => entrada_acierto.ET_acc, 
                 ET_esc => entrada_acierto.ET_esc);
					  
control_ET_f <= (ET_acc => entrada_fallo.ET_acc, 
                 ET_esc  => entrada_fallo.ET_esc);
					  
muxET: mux_ET port map(entrada_acierto => control_ET_a, entrada_fallo => control_ET_f, sel => muxControl, salida => control_ET);

-- Multiplexor Estado --
control_EST_a <= (EST_acc => entrada_acierto.EST_acc, 
                  EST_esc => entrada_acierto.EST_esc,
					   EST_esc_ocupado => entrada_acierto.EST_esc_ocupado,	
						EST_DE => entrada_acierto.EST_DE);
					  
control_EST_f <= (EST_acc => entrada_fallo.EST_acc, 
                  EST_esc  => entrada_fallo.EST_esc,
					   EST_esc_ocupado => entrada_fallo.EST_esc_ocupado,	
						EST_DE => entrada_fallo.EST_DE);
						
muxEST: mux_EST port map(entrada_acierto => control_EST_a, entrada_fallo => control_EST_f, sel => muxControl, salida => control_EST);

-- Multiplexor Datos --
control_DAT_a <= (DAT_acc => entrada_acierto.DAT_acc, 
                  DAT_palabra_esc => entrada_acierto.DAT_palabra_esc, 
						DAT_bloque_esc => entrada_acierto.DAT_bloque_esc);
					  
control_DAT_f <= (DAT_acc => entrada_fallo.DAT_acc, 
                  DAT_palabra_esc => entrada_fallo.DAT_palabra_esc, 
						DAT_bloque_esc => entrada_fallo.DAT_bloque_esc);
						
muxDAT: mux_DAT port map(entrada_acierto => control_DAT_a, entrada_fallo => control_DAT_f, sel => muxControl, salida => control_DAT);

end estructural;