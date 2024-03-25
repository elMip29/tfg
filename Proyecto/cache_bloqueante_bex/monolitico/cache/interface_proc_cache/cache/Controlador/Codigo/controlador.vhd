library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity controlador is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 resp_m: in tp_cntl_memoria_e;
		 s_control: out tp_contro_cam_cntl;
		 bex_control: out tp_cntl_bex;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end controlador;

architecture comportamiento of controlador is 

signal estado, prxestado: tipoestado;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST = Contenedor_L or info_estado.EST = Contenedor_M)) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_M) else '0';

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DES0;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, pet, info_estado, estado, resp_m, derechos_acceso, expulsion_modificado)
variable v_estado: tipoestado;
begin 
   v_estado := estado;
	if (pcero = not puesta_cero) then 
	    case estado is
		      when DES0 =>
				    if (hay_peticion_procesador(pet)) then
					     if (hay_peticion_ini_procesador(pet)) then 
					         v_estado := INI;
						  else 
						      v_estado := CMPET;
						  end if;
					 end if;
					 
				when INI =>
				    v_estado := ESCINI;
					 
				when ESCINI =>
				    v_estado := DES;
					 
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
					       v_estado := CMPET;
						 end if;	
					 end if;
				
				when CMPET =>
				    if (es_acierto_lectura(pet, derechos_acceso)) then 
					     v_estado := LEC;
					 elsif (es_acierto_escritura(pet, derechos_acceso)) then 
					     v_estado := ESC;
					 elsif (es_fallo(derechos_acceso)) then 
					     v_estado := PBL;
				    end if;
					 
				when PBL => 
				    v_estado := ESPL;
					 
				when ESPL =>
				    if (hay_respuesta_memoria(resp_m)) then
					     v_estado := ESB;
					 end if;
					 
				when ESB =>
				    if (es_fallo_lectura(pet, derechos_acceso)) then 
					     v_estado := LEC;
					 elsif (es_fallo_escritura(pet, derechos_acceso)) then 
					     v_estado := ESC;
					 end if;
					 
				when ESC =>
				    if (es_expulsion_bl_modificado(expulsion_modificado)) then 
					     v_estado := ESPE;
					 else 
				        v_estado := DES;
					 end if;
				
				when LEC =>
				    if (es_expulsion_bl_modificado(expulsion_modificado)) then 
					     v_estado := ESPE;
					 else 
				        v_estado := DES;
					 end if;
				
				when ESPE =>
				    if (hay_respuesta_memoria(resp_m)) then
					     v_estado := DES;
					 end if;
					 
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, pet, info_estado, estado, resp_m, derechos_acceso, expulsion_modificado)
variable v_s_control: tp_contro_cam_cntl;
variable v_resp: tp_contro_s;
variable v_pet_m: tp_cntl_memoria_s;
variable v_bex_control: tp_cntl_bex;

begin

   por_defecto(v_bex_control, v_s_control, v_pet_m, v_resp);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DES0 => 
				    if (hay_peticion_procesador(pet)) then 
					     if (hay_peticion_ini_procesador(pet)) then 
						  else 
					         lectura_etiq_estado(v_s_control);
						  end if;
					 end if;
					 
				when INI =>
				    actualizar_etiqueta(v_s_control);
					 actualizar_estado(v_s_control, contenedor_M);
					 actualizar_dato(v_s_control);
					 interfaces_en_CURSO(v_resp);
				
				when ESCINI =>
				    interfaces_HECHOE(v_resp);
				
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
					       lectura_etiq_estado(v_s_control);
						 end if;
					 end if;
					 
				when CMPET =>
				    if (es_acierto_lectura(pet, derechos_acceso)) then 
					     lectura_datos(v_s_control);
					 elsif (es_acierto_escritura(pet, derechos_acceso)) then
					     if (info_estado.EST = contenedor_L) then
						      actualizar_estado(v_s_control, contenedor_M); 
						  end if;
					     actualizar_dato_palabra(v_s_control);
					 elsif (es_fallo(derechos_acceso)) then
			              peticion_memoria_lectura(v_pet_m);
						     control_muxE_fallo(v_s_control);
						     if (es_expulsion_bl_modificado(expulsion_modificado)) then
					            lectura_datos(v_s_control);
				           end if;			        
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when PBL => 
				    interfaces_en_CURSO(v_resp);
					 if (es_expulsion_bl_modificado(expulsion_modificado)) then 
					     escritura_BEX(v_bex_control);
					 end if;
					 
				when ESPL =>
				    if (hay_respuesta_memoria(resp_m)) then 
					     actualizar_etiqueta(v_s_control);
						  actu_datos_desde_bus(v_s_control);
						  actualizar_dato(v_s_control);
					     if (es_fallo_lectura(pet, derechos_acceso)) then
						      actualizar_estado(v_s_control, contenedor_L);
						  elsif (es_fallo_escritura(pet, derechos_acceso)) then 
						      actualizar_estado(v_s_control, contenedor_M);
						  end if;
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESB => 
				    if (es_lectura(pet)) then 
					     lectura_datos(v_s_control);
					 elsif (es_escritura(pet)) then 
					     actualizar_dato_palabra(v_s_control);
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESC =>
				     if (es_expulsion_bl_modificado(expulsion_modificado)) then
					      invalidar_BEX(v_bex_control);
							expulsar_bloque_modificado(v_s_control);
							control_muxE_expulsion(v_s_control);
							peticion_memoria_escritura(v_pet_m);
					  end if;
				     interfaces_HECHOE(v_resp);
					  
				when LEC =>
			        if (es_expulsion_bl_modificado(expulsion_modificado)) then
					      invalidar_BEX(v_bex_control);
							expulsar_bloque_modificado(v_s_control);
							control_muxE_expulsion(v_s_control);
							peticion_memoria_escritura(v_pet_m);
					  end if;	
				     interfaces_HECHOL(v_resp);
					 
				when ESPE =>
					 interfaces_en_CURSO(v_resp);
				
		 end case;
						    
   end if;
	
   s_control <= v_s_control after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
	pet_m <= v_pet_m after retardo_logica_salida;
   bex_control <= v_bex_control after retardo_logica_salida;	
	
end process;

end;