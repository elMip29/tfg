library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.procedimientos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.retardos_pkg.all;

entity auto_acceso is 
   port(reloj: in std_logic;
        pcero: in std_logic;
		  pet: in tp_contro_e;
		  info_estado: in tp_contro_cam_estado;
		  conc_arb: in std_logic; -- Concesion de los recursos
		  val_BDF: in std_logic; -- Senyal validez del buffer de direccion de fallo
		  val_BEX: in std_logic;
		  lec_ET_EST: in std_logic;
		  s_control_acierto: out tp_contro_cam_acceso;
		  pet_arb_camino: out tp_arb_recursos_pet;
		  pet_arb_bus: out tp_arb_pet;
		  bex_control: out tp_cntl_bex;
		  bdf_control: out tp_cntl_bdf;
		  resp: out tp_contro_s);
end entity;

architecture comportamiento of auto_acceso is 

signal estado, prxestado: tipoestado_acceso;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST = Contenedor_L or info_estado.EST = Contenedor_M)) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST = Contenedor_M) else '0';

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado_acceso;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := DES0;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, pet, info_estado, estado, derechos_acceso, expulsion_modificado, conc_arb, val_BDF, val_BEX, lec_ET_EST)
variable v_estado: tipoestado_acceso;
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
						    if (hay_concesion_camino(conc_arb)) then 
					           v_estado := CMPET;
							 end if;
						 end if;	
					 end if;
				
				when CMPET =>
				    if (hay_lectura_ET_EST(lec_ET_EST)) then 
					 else 
				        if (es_acierto(derechos_acceso)) then 
					         if (hay_concesion_camino(conc_arb)) then 
						          if (es_acierto_lectura(pet, derechos_acceso)) then 
					                 v_estado := LEC;
					             elsif (es_acierto_escritura(pet, derechos_acceso)) then 
					                 v_estado := ESC;
								    end if;
						      end if;
					     elsif (es_fallo(derechos_acceso)) then 
					         if (es_bdf_valido(val_BDF)) then -- Si es fallo y el BDF esta lleno, bloqueamos la peticion del procesador
							   elsif (es_expulsion_bl_modificado(expulsion_modificado) and info_bex_valida(val_BEX)) then -- Si el acceso provoca una expulsion
							   else                                                                                       -- y el BEX esta lleno, bloqueamos peticion
							       if (es_expulsion_bl_modificado(expulsion_modificado)) then 
									     if (hay_concesion_camino(conc_arb)) then 
										      v_estado := ABDF;
							           end if;
									 else
									     v_estado := ABDF;
									 end if;
							   end if;
				        end if;
					 end if;
					 
				when ABDF => 
				    v_estado := DES;
					 
				when ESC =>
				    v_estado := DES;
				
				when LEC =>
				    v_estado := DES;
					 
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, pet, info_estado, estado, derechos_acceso, expulsion_modificado, conc_arb, val_BDF, val_BEX, lec_ET_EST)
variable v_s_control_acierto: tp_contro_cam_acceso;
variable v_resp: tp_contro_s;
variable v_bex_control: tp_cntl_bex;
variable v_pet_arb_camino: tp_arb_recursos_pet;
variable v_pet_arb_bus: tp_arb_pet;
variable v_bdf_control: tp_cntl_bdf;
variable v_peticion_pendiente: std_logic;

begin

   por_defecto_acceso(v_bex_control, v_s_control_acierto, v_resp, v_pet_arb_camino, v_pet_arb_bus, v_bdf_control, v_peticion_pendiente);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DES0 => 
				    if (hay_peticion_procesador(pet)) then 
					     if (hay_peticion_ini_procesador(pet)) then 
						  else 
					         lectura_etiq_estado(v_s_control_acierto);
						  end if;
					 end if;
					 
				when INI =>
				    actualizar_etiqueta(v_s_control_acierto);
					 actualizar_estado(v_s_control_acierto, contenedor_M);
					 actualizar_dato(v_s_control_acierto);
					 interfaces_en_CURSO(v_resp);
				
				when ESCINI =>
				    interfaces_HECHOE(v_resp);
				
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
						    --mantener_peticion(v_peticion_pendiente);
						    peticion_arbitraje_recursos(v_pet_arb_camino);
							 if (hay_concesion_camino(conc_arb)) then 
					           lectura_etiq_estado(v_s_control_acierto);
							 end if;
						 end if;
					 end if;
					 
				when CMPET =>
				    if (es_acierto(derechos_acceso)) then 
					     peticion_arbitraje_recursos(v_pet_arb_camino);
					     if (hay_concesion_camino(conc_arb)) then 
						      if (es_acierto_lectura(pet, derechos_acceso)) then 
					             lectura_datos(v_s_control_acierto);
								elsif (es_acierto_escritura(pet, derechos_acceso)) then
					             if (info_estado.EST = contenedor_L) then
						              actualizar_estado(v_s_control_acierto, contenedor_M); 
						          end if;
					             actualizar_dato_palabra(v_s_control_acierto);
								end if; 
						  end if;
					 elsif (es_fallo(derechos_acceso)) then 
					        if (hay_lectura_ET_EST(lec_ET_EST)) then 
							      peticion_arbitraje_recursos(v_pet_arb_camino);
									if (hay_concesion_camino(conc_arb)) then 
							          lectura_etiq_estado(v_s_control_acierto);
									end if;
							  else 
					            if (es_bdf_valido(val_BDF)) then 
							      elsif (es_expulsion_bl_modificado(expulsion_modificado) and info_bex_valida(val_BEX)) then
							          peticion_arbitraje_con_exp(v_pet_arb_bus);
							      else 
							          escritura_BDF(v_bdf_control, pet);
									    if (es_expulsion_bl_modificado(expulsion_modificado)) then 
									        peticion_arbitraje_recursos(v_pet_arb_camino);
										     if (hay_concesion_camino(conc_arb)) then
									            lectura_bloq_expulsado(v_s_control_acierto);
										         invalidar_bloque(v_s_control_acierto);
										     end if;
									    end if;
							      end if;
							  end if;
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when ABDF => 
				     if (es_expulsion_bl_modificado(expulsion_modificado)) then 
				         escritura_BEX(v_bex_control);
					  end if;
					  interfaces_HECHOE(v_resp);
					 
				when ESC =>
				     interfaces_HECHOE(v_resp);
					  
				when LEC =>
				     interfaces_HECHOL(v_resp);
				
		 end case;
						    
   end if;
	
   s_control_acierto <= v_s_control_acierto after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
   bex_control <= v_bex_control after retardo_logica_salida;	
	pet_arb_camino <= v_pet_arb_camino after retardo_logica_salida;
	pet_arb_bus <= v_pet_arb_bus after retardo_logica_salida;
	bdf_control <= v_bdf_control after retardo_logica_salida;
	--peticion_pendiente <= v_peticion_pendiente after retardo_logica_salida;	
end process;

end comportamiento;