library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_L2_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity controlador_L2 is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet_L1: in tp_contro_e_L2;
		 info_estado: in tp_contro_cam_estado_L2;
		 identificador: in integer;
		 resp_m: in tp_cntl_memoria_e;
		 s_control: out tp_contro_cam_cntl_L2;
		 resp: out tp_contro_s;
		 val_BC: out std_logic;
		 pet_m: out tp_cntl_memoria_s;
		 s_error: out std_logic); -- Senyal de error que para la jerarquia en caso de encontrar un fallo en el protocolo de coherencia L1-L2
end controlador_L2;

architecture comportamiento of controlador_L2 is 

signal estado, prxestado: tipoestado_L2;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST = Contenedor_L_L2 or info_estado.EST = Contenedor_LNP_L2 or info_estado.EST = Contenedor_M_L2 or info_estado.EST = Contenedor_MNP_L2)) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_MNP_L2) else '0';

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado_L2;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DES0;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, pet_L1, info_estado, estado, resp_m, derechos_acceso, expulsion_modificado)
variable v_estado: tipoestado_L2;
begin 
   v_estado := estado;
	if (pcero = not puesta_cero) then 
	    case estado is
		      when DES0 =>
				    if (hay_peticion_L1(pet_L1)) then
					     if (hay_peticion_ini_L1(pet_L1)) then 
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
				    if (hay_peticion_L1(pet_L1)) then 
					    if (hay_peticion_ini_L1(pet_L1)) then 
						 else 
					       v_estado := CMPET;
						 end if;	
					 end if;
				
				when CMPET =>
				    if (es_acierto(derechos_acceso)) then 
					     if (es_peticion_Pt(pet_L1)) then -- En el caso de que sea un Pt hay que suministrar el bloque a la L1
						      v_estado := LEC;
						  elsif (es_peticion_PtX(pet_L1) or es_peticion_PtXl(pet_L1)) then -- Tanto si es un PtX o un PtXl, se va a ESC
						      v_estado := ESC;
						  end if;
					 elsif (es_expulsion_bl_modificado(expulsion_modificado)) then
					     v_estado := LVIC;
					 elsif (es_fallo(derechos_acceso)) then 
					        if (es_peticion_PtX(pet_L1) or (expulsion_M_L(info_estado.EST))) then -- Si se emite un PtX de un bloque no almacenado o se expulsa un bloque
							      v_estado := DES;                                                  -- cuando el bit de presencia esta activado, activar una senyal de error.
							  else                                                                  -- Se infiere un error en el protocolo para mantener la inclusion
					            v_estado := PBL;
							  end if;
				    end if;
					 
				when LVIC => 
				    v_estado := PEX;
					 
				when PEX =>
				    v_estado := ESPE;
				
				when ESPE =>
				    if (hay_respuesta_memoria(resp_m)) then
					     v_estado := PBL;
					 end if;
					  
				when PBL =>
				    v_estado := ESPL;
				
				when ESPL =>
				    if (hay_respuesta_memoria(resp_m)) then
					     v_estado := ESB;
					 end if;
				
				when ESB =>
				    v_estado := LEC;
				    
				when ESC =>
				    v_estado := DES;
				
				when LEC =>
				    v_estado := DES;
	
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, pet_L1, info_estado, estado, resp_m, derechos_acceso, expulsion_modificado, identificador)
variable v_s_control: tp_contro_cam_cntl_L2;
variable v_resp: tp_contro_s;
variable v_pet_m: tp_cntl_memoria_s;
variable v_s_error: std_logic;
variable v_val_bc: std_logic;

begin

   por_defecto(v_s_control, v_pet_m, v_resp, v_s_error, v_val_bc);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DES0 => 
				    if (hay_peticion_L1(pet_L1)) then 
					     if (hay_peticion_ini_L1(pet_L1)) then
						  else 
					         lectura_etiq_estado(v_s_control);
						  end if;
					 end if;
					 
				when INI =>
				    actualizar_etiqueta(v_s_control);
					 actualizar_estado(v_s_control, contenedor_M_L2); -- Como la L1 en una peticion de inicio deja el contenedor accedido en estado M
					 actualizar_dato(v_s_control);                 -- L2 hace lo mismo
					 interfaces_en_CURSO(v_resp);
				
				when ESCINI =>
				    interfaces_HECHOE(v_resp);
				
				when DES =>
				    if (hay_peticion_L1(pet_L1)) then 
					    if (hay_peticion_ini_L1(pet_L1)) then 
						 else 
					       lectura_etiq_estado(v_s_control);
						 end if;
					 end if;
					 
				when CMPET =>
				    if (es_acierto(derechos_acceso)) then 
					     if (es_peticion_Pt(pet_L1)) then 
						      lectura_datos(v_s_control);
								if (info_estado.EST = contenedor_LNP_L2) then
								    actualizar_estado(v_s_control, contenedor_L_L2); -- Actualizamos estado si el bloque no estaba presente en L1
								elsif (info_estado.EST = contenedor_MNP_L2) then 
							       actualizar_estado(v_s_control, contenedor_M_L2); -- Actualizamos estado si el bloque no estaba presente en L1
								end if;
						  elsif (es_peticion_PtX(pet_L1)) then 
						      if (info_estado.EST = contenedor_L_L2 or info_estado.EST = contenedor_M_L2) then -- L1 expulsa su copia del bloque. Actualizar estado
								    actualizar_estado(v_s_control, contenedor_MNP_L2);                        -- si es el caso
								end if;
								actualizar_dato(v_s_control); -- Actualizamos la copia de L2
						  elsif (es_peticion_PtXl(pet_L1)) then 
						         if (info_estado.EST = contenedor_L_L2) then 
									    actualizar_estado(v_s_control, contenedor_LNP_L2);
									elsif (info_estado.EST = contenedor_M_L2) then 
									    actualizar_estado(v_s_control, contenedor_MNP_L2);
									end if;
						  end if;
					 elsif (es_expulsion_bl_modificado(expulsion_modificado)) then
                       lectura_datos(v_s_control);
					 elsif (es_fallo(derechos_acceso)) then
					        if (es_peticion_PtX(pet_L1) and (expulsion_M_L(info_estado.EST))) then
							      activar_error(v_s_error);
							  else 
                           peticion_memoria_lectura(v_pet_m, identificador); -- Si es fallo hay que emitir un Ptm a memoria
							  end if;
				    end if;
					 interfaces_en_CURSO(v_resp);
				
				when LVIC => 
				    expulsar_bloque_modificado(v_s_control);
					 peticion_memoria_escritura(v_pet_m); -- Si se reemplaza un bloque modificado hay que emitir un PtXm
					 interfaces_en_CURSO(v_resp);
				
				when PEX =>
				    interfaces_en_CURSO(v_resp);
					 
				when ESPE =>
				    if (hay_respuesta_memoria(resp_m)) then 
					     peticion_memoria_lectura(v_pet_m, identificador);
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when PBL => 
				    interfaces_en_CURSO(v_resp);
					 
				when ESPL =>
				    if (hay_respuesta_memoria(resp_m)) then 
					     actualizar_etiqueta(v_s_control);
						  actu_datos_desde_bus(v_s_control);
						  actualizar_dato(v_s_control);
						  actualizar_estado(v_s_control, contenedor_L_L2);
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESB => 
					 lectura_datos(v_s_control);
				    interfaces_en_CURSO(v_resp);
					 
				when ESC =>
				     interfaces_HECHOE(v_resp);
					  
				when LEC => 
				     validar_BC(v_val_bc);
				     interfaces_HECHOL(v_resp);
		 end case;
						    
   end if;
	
   s_control <= v_s_control after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
	pet_m <= v_pet_m after retardo_logica_salida;
	s_error <= v_s_error after retardo_logica_salida;
	val_BC <= v_val_bc after retardo_logica_salida;
	
end process;

end;