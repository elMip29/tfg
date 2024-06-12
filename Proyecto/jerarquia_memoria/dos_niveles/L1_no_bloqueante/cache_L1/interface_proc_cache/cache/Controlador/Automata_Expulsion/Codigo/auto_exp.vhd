library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity auto_exp is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 forzar_exp: in std_logic;
		 concesion_arb: in std_logic;
		 tipo_exp: in std_logic;
		 pet_arb_bex: out tp_arb_pet;
		 s_expulsion: out std_logic;
		 bex_control: out tp_cntl_bex;
		 pet_L2: out tp_cntl_L2_s);
end auto_exp;

architecture comportamiento of auto_exp is 

signal estado, prxestado: tipoestado_expulsion;

begin

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado_expulsion;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DESEX;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, estado, forzar_exp, concesion_arb)
variable v_estado: tipoestado_expulsion;
begin 
   v_estado := estado;
	if (pcero = not puesta_cero) then 
	    case estado is
		      when DESEX =>
				    if (es_forzar_exp(forzar_exp)) then 
					     if (hay_concesion_bus_bex(concesion_arb)) then 
						      v_estado := ESPE;
				        end if;
					 end if;

				when ESPE => 
					 v_estado := DESEX;
					 
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
end process;


-- Logica de salida
logica_salida: process(pcero, estado, forzar_exp, concesion_arb, tipo_exp)
variable v_s_expulsion: std_logic;
variable v_pet_arb_bex: tp_arb_pet;
variable v_pet_L2: tp_cntl_L2_s;
variable v_bex_control: tp_cntl_bex;
begin

   por_defecto_bex(v_bex_control, v_s_expulsion, v_pet_L2, v_pet_arb_bex);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DESEX => 
				     if (es_forzar_exp(forzar_exp)) then 
					      peticion_arbitraje_bex(v_pet_arb_bex);
							if (hay_concesion_bus_bex(concesion_arb)) then 
							    invalidar_BEX(v_bex_control);
								 control_muxE_expulsion(v_s_expulsion);
								 if (es_exp_PtXl(tipo_exp)) then -- Si el tipo de expulsion almacenada en el buffer es un PtXl
								     enviar_pet_PtXl(v_pet_L2);
								 elsif (es_expulsion_bl_modificado(tipo_exp)) then -- Si es un PtX
								     enviar_pet_PtX(v_pet_L2);
								 end if;
						   end if;
					  end if;
				
				when ESPE => 
				    -- No se ha de activar ninguna señal en este estado
				
		 end case;
						    
   end if;
	
   s_expulsion <= v_s_expulsion after retardo_logica_salida;
	pet_L2 <= v_pet_L2 after retardo_logica_salida;
   bex_control <= v_bex_control after retardo_logica_salida;	
	pet_arb_bex <= v_pet_arb_bex after retardo_logica_salida;
end process;

end;