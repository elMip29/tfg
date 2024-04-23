library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity auto_fallo is
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 mem_ocupada: in std_logic;
		 conc_arb: in std_logic;
		 LE: in std_logic;
		 s_control: out tp_contro_cam_acierto_cntl;
		 s_control_fallo: out tp_contro_cam_fallo_cntl;
		 pet_arb: out tp_arb_pet;
		 bex_control: out tp_cntl_bex;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end auto_fallo;

architecture comportamiento of auto_fallo is 

signal estado, prxestado: tipoestado_fallo;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST = Contenedor_L or info_estado.EST = Contenedor_M)) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_M) else '0';

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado_fallo;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DES0;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, pet, info_estado, estado, mem_ocupada, derechos_acceso, expulsion_modificado, conc_arb)
variable v_estado: tipoestado_fallo;
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
				    if (hay_concesion_bus(conc_arb)) then 
				        v_estado := ESPL;
					 end if;
					 
				when ESPL =>
				    if (memoria_lista(mem_ocupada)) then
					     v_estado := ABC;
					 end if;
					 
				when ABC => 
				    v_estado := ESB;
					 
				when ESB =>
				    if (es_lectura(LE)) then 
					     v_estado := LEC_F;
					 elsif (es_escritura(LE)) then 
					     v_estado := ESC_F;
					 end if;
					 
				when ESC =>
				    v_estado := DES;
				
				when LEC =>
				    v_estado := DES;
					 
			   when ESC_F => 
				    v_estado := DES;
				
				when LEC_F => 
				    v_estado := DES;
				
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, pet, info_estado, estado, mem_ocupada, derechos_acceso, expulsion_modificado, conc_arb)
variable v_s_control: tp_contro_cam_acierto_cntl;
variable v_s_control_f : tp_contro_cam_fallo_cntl;
variable v_resp: tp_contro_s;
variable v_pet_m: tp_cntl_memoria_s;
variable v_bex_control: tp_cntl_bex;
variable v_pet_arb: tp_arb_pet;
variable v_bdf_control: tp_cntl_bdf;
variable v_bc_control: tp_cntl_bc;

begin

   por_defecto(v_bex_control, v_s_control, v_s_control_f, v_pet_m, v_resp, v_pet_arb, v_bdf_control, v_bc_control);
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
				    activar_mux_cam_acierto(v_s_control);
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
					     activar_mux_cam_acierto(v_s_control);
						  desactivar_mux_BDF(v_s_control);
					     lectura_datos(v_s_control);
					 elsif (es_acierto_escritura(pet, derechos_acceso)) then
					     if (info_estado.EST = contenedor_L) then
						      actualizar_estado(v_s_control, contenedor_M); 
						  end if;
						  activar_mux_cam_acierto(v_s_control);
					     actualizar_dato_palabra(v_s_control);
						  desactivar_mux_BDF(v_s_control);
					 elsif (es_fallo(derechos_acceso)) then
					        escritura_BDF(v_bdf_control, pet);
					        if (es_expulsion_bl_modificado(expulsion_modificado)) then 
							      lectura_bloq_expulsado_e_invalida(v_s_control);
									escritura_BEX(v_bex_control);
							  end if;
							  	        
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when PBL => 
				    interfaces_en_CURSO(v_resp);
					 
					 if (es_expulsion_bl_modificado(expulsion_modificado)) then 
					     peticion_arbitraje_con_exp(v_pet_arb);
					 else 
					     peticion_arbitraje(v_pet_arb);
					 end if;
					     
					 if (hay_concesion_bus(conc_arb)) then 
					     control_muxE_fallo(v_s_control_f);
			           peticion_memoria_lectura(v_pet_m);	      
				    end if;		
					 
				when ESPL =>
				    if (memoria_lista(mem_ocupada)) then 
					     escritura_BC(v_BC_control);
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when ABC => 
				    activar_mux_BDF(v_s_control_f);
					 activar_mux_cam_fallo(v_s_control_f);
					 actu_dato_desde_BC(v_s_control_f);
					 actualizar_etiqueta_f(v_s_control_f);
					 actualizar_dato_f(v_s_control_f);
					 invalidar_BDF(v_bdf_control);
					 invalidar_BC(v_bc_control);
					 
					 if (es_lectura(LE)) then
						  actualizar_estado_f(v_s_control_f, contenedor_L);
					 elsif (es_escritura(LE)) then 
						  actualizar_estado_f(v_s_control_f, contenedor_M);
					 end if;
					 interfaces_en_CURSO(v_resp);
				    
				when ESB => 
				    activar_mux_cam_fallo(v_s_control_f);
					 
				    if (es_lectura(LE)) then 
					     lectura_datos_f(v_s_control_f);
					 elsif (es_escritura(LE)) then 
					     actualizar_dato_palabra_f(v_s_control_f);
					 end if;
				    interfaces_en_CURSO(v_resp);
					 
				when ESC =>
				     interfaces_HECHOE(v_resp);
					  
				when LEC =>
				     interfaces_HECHOL(v_resp);
					  
				when ESC_F => 
				     interfaces_HECHOE(v_resp);
					  
				when LEC_F => 
				     interfaces_HECHOL(v_resp);
				
		 end case;
						    
   end if;
	
   s_control <= v_s_control after retardo_logica_salida;
	s_control_fallo <= v_s_control_f after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
	pet_m <= v_pet_m after retardo_logica_salida;
   bex_control <= v_bex_control after retardo_logica_salida;	
	pet_arb <= v_pet_arb after retardo_logica_salida;
	bdf_control <= v_bdf_control after retardo_logica_salida;
	bc_control <= v_bc_control after retardo_logica_salida;
	
end process;

end;