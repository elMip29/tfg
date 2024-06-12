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
		  fallo_secundario: in std_logic;
		  mismo_cont_L2: in std_logic;
		  L2_ocupada: in std_logic;
		  s_control_acierto: out tp_contro_cam_acceso;
		  pet_arb_camino: out tp_arb_recursos_pet;
		  pet_arb_bus: out tp_arb_pet;
		  bex_control: out tp_cntl_bex;
		  bdf_control: out tp_cntl_bdf;
		  resp: out tp_contro_s;
		  pet_L2: out tp_cntl_L2_s); -- Para enviar la peticion de Inicio a L2
end entity;

architecture comportamiento of auto_acceso is 

signal estado, prxestado: tipoestado_acceso;
signal derechos_acceso: std_logic;
signal expulsion_modificado: std_logic;
signal contenedor_ocupado: std_logic;
signal expulsion_lectura: std_logic; -- Senyal para detectar las expulsiones de bloques no modificados

begin

derechos_acceso <= '1' when (info_estado.AF = '1' and (info_estado.EST(1 downto 0) = Contenedor_L(1 downto 0) or info_estado.EST(1 downto 0) = Contenedor_M(1 downto 0))) else '0';
expulsion_modificado <= '1' when (derechos_acceso = '0' and info_estado.EST(1 downto 0) = Contenedor_M(1 downto 0)) else '0';
expulsion_lectura <= '1' when (derechos_acceso = '0' and info_estado.EST(1 downto 0) = Contenedor_L(1 downto 0)) else '0';
contenedor_ocupado <= '1' when (info_estado.EST(2) = '1') else '0'; -- Senyal para indicar que el contenedor a usar esta ocupado por otra peticion

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
logica_prx_estado: process(pcero, pet, info_estado, estado, derechos_acceso, expulsion_modificado, expulsion_lectura, conc_arb, val_BDF, val_BEX, fallo_secundario, contenedor_ocupado, mismo_cont_L2, L2_ocupada)
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
							 else 
							     v_estado := DES_ARB; -- Si no conceden los recursos, se espera la concesion en un nuevo estado, desactivando la senyal listo de la cache
							 end if;                  -- De este modo se mantiene la peticion
						 end if;	
					 end if;
				
				when DES_ARB => 
				    if (hay_concesion_camino(conc_arb)) then 
						  v_estado := CMPET;
					 end if;
				
				when CMPET =>
					 if (es_fallo_secundario(fallo_secundario)) then -- Si se trata de un fallo secundario, se va a un nuevo estado.
					     v_estado := FALLO_SEC;                      -- Se sabe ya que ha de dar acierto, por lo tanto solo ha de esperar a la concesion de los recursos
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
						      if (esta_contenedor_ocupado(contenedor_ocupado)) then -- Si el contenedor esta ocupado, esperamos a que se libere en un estado nuevo
								    v_estado := ESP_CONT;
							   elsif ((es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura)) and info_bex_valida(val_BEX)) then -- Si el acceso provoca una expulsion
							   else                                                                                                                                       -- y el BEX esta lleno, bloqueamos peticion
							       if (es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura)) then
									     if ((van_mismo_cont_L2(mismo_cont_L2))) then -- Si van al mismo contenedor en L2, L2 ha de actualizarse antes de emitir el Pt
										       if (hay_concesion_camino(conc_arb)) then
										           v_estado := EXP_BL;
												 end if; 
									     elsif (hay_concesion_camino(conc_arb)) then 
										      v_estado := ABDF;
							           end if;
									 else
									     v_estado := ABDF; -- De cualquier forma se ha de ir a ABDF si la peticion da fallo. Pero si provoca una expulsion 
									 end if;               -- es necesario pedir los recursos del camino para escribir en el bex
							   end if;
				        end if;
					 end if;
            
				when ESP_CONT => -- Nuevo estado que sire para esperar que el contenedor se libere 
						 if (es_bdf_valido(val_BDF)) then 
						 else 
					        if (hay_concesion_camino(conc_arb)) then 
						         v_estado := CMPET; -- Cuando nos conceden los recursos, se va a un estado pseudoCMPET en donde se comprueba
							  end if;                    -- si hay que expulsar el bloque
						  end if; 
					 
				when FALLO_SEC => -- Estado que trata el fallo secundario
				    if (es_bdf_valido(val_BDF)) then 
					 else 
					     if (hay_concesion_camino(conc_arb)) then 
						      if (es_lectura(pet.esc)) then 
								    v_estado := LEC;
								elsif (es_escritura(pet.esc)) then 
								    v_estado := ESC;
								end if;
						  end if;
					 end if;
					 
				when EXP_BL => -- Estado que escribe en el BEX para frozar su expulsion en el siguiente ciclo
			      if (esta_L2_ocupada(L2_ocupada)) then -- Como hay que forzar, esperamos a que L2 este libre
			      else 		
				        v_estado := ABDF;
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
logica_salida: process(pcero, pet, info_estado, estado, derechos_acceso, expulsion_modificado, expulsion_lectura, conc_arb, val_BDF, val_BEX, fallo_secundario, contenedor_ocupado, mismo_cont_L2, L2_ocupada)
variable v_s_control_acierto: tp_contro_cam_acceso;
variable v_resp: tp_contro_s;
variable v_bex_control: tp_cntl_bex;
variable v_pet_arb_camino: tp_arb_recursos_pet;
variable v_pet_arb_bus: tp_arb_pet;
variable v_bdf_control: tp_cntl_bdf;
variable v_pet_L2: tp_cntl_L2_s;

begin

   por_defecto_acceso(v_bex_control, v_s_control_acierto, v_resp, v_pet_arb_camino, v_pet_arb_bus, v_bdf_control, v_pet_L2);
	if (pcero = not puesta_cero) then 
	    case estado is 
		      when DES0 => 
				    if (hay_peticion_procesador(pet)) then 
					     if (hay_peticion_ini_procesador(pet)) then 
						      enviar_inicio_L2(v_pet_L2); -- Enviamos peticion de Inicio a L2
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
					 recoger_identificador(v_resp, pet.identificador);
				
				when DES =>
				    if (hay_peticion_procesador(pet)) then 
					    if (hay_peticion_ini_procesador(pet)) then 
						 else 
						    peticion_arbitraje_recursos(v_pet_arb_camino);
							 if (hay_concesion_camino(conc_arb)) then 
					           lectura_etiq_estado(v_s_control_acierto);
							 end if;
						 end if;
					 end if;
				
				when DES_ARB => 
				    interfaces_en_CURSO(v_resp);
					 peticion_arbitraje_recursos(v_pet_arb_camino);
					 if (hay_concesion_camino(conc_arb)) then 
					     lectura_etiq_estado(v_s_control_acierto);
					 end if;
					 
				when CMPET =>
				    if (es_fallo_secundario(fallo_secundario)) then -- No se hace nada ya que se cambia de estado
					 else 
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
									if (esta_contenedor_ocupado(contenedor_ocupado)) then -- Si contenedor ocupado no se hace nada
					 	   	   elsif ((es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura)) and info_bex_valida(val_BEX)) then
					 	   	       peticion_arbitraje_con_exp(v_pet_arb_bus); -- Bex lleno, se fuerza la expulsion
									elsif (van_mismo_cont_L2(mismo_cont_L2)) then -- Caso de mismo contenedor en L2
									       if (es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura))  then 
							  	              peticion_arbitraje_recursos(v_pet_arb_camino);
										        if (hay_concesion_camino(conc_arb)) then
					 	   			            lectura_bloq_expulsado(v_s_control_acierto); -- Leemos e invalidamos el bloque a expulsar
					 	   			            invalidar_bloque(v_s_control_acierto);
												  end if;
											 end if;
					 	   	   else 
					 	   	       escritura_BDF(v_bdf_control, pet);
					 	   		    if (es_expulsion_bl_modificado(expulsion_modificado) or es_expulsion_bl_lectura(expulsion_lectura)) then 
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
					 
				when ESP_CONT => 
				     if (esta_contenedor_ocupado(contenedor_ocupado)) then
						   if (es_bdf_valido(val_BDF)) then -- Mientras el BDF este ocupado, no se puede pedir la concesion a los recursos del camino. Ya que 
						   else                             -- la peticion que se procesa en paralelo puede adelantarse (Si el fallo esta en el estado ESPL, podrian darle la concesion)
							    peticion_arbitraje_recursos(v_pet_arb_camino);
					          if (hay_concesion_camino(conc_arb)) then -- Concesion de los recursos del camino mientras contenedor ocupado. Significa que el fallo ya se ha procesado (No se ha leido aun el estado por tanto la senyal de control del contenedor ocupado no cambia)
									  lectura_etiq_estado(v_s_control_acierto); -- Lectura de la etiqueta y el estado. Esto permite identificar si se produce una expulsion
					          end if;                                       -- La lectura de la etiqueta es necesaria para la reconstruccion de la direccion de bloque en caso de expulsion
							end if;
					  end if; 
					  interfaces_en_CURSO(v_resp);	    
					 
				when FALLO_SEC => 
				     if (es_bdf_valido(val_BDF)) then
					  else 
					      peticion_arbitraje_recursos(v_pet_arb_camino);
						   if (hay_concesion_camino(conc_arb)) then 
						       if (es_lectura(pet.esc)) then 
								     lectura_datos(v_s_control_acierto);
								 elsif (es_escritura(pet.esc)) then 
						               actualizar_estado(v_s_control_acierto, contenedor_M); -- Al no leer el estado en el que deja el contenedor el fallo que se estaba procesando
						               actualizar_dato_palabra(v_s_control_acierto);         -- En el caso de la escritura, se ha de obligar siempre a poner el estado a Modificado     
								 end if;
							end if;
						end if;
						interfaces_en_CURSO(v_resp);
						
				when EXP_BL =>
				      if (esta_L2_ocupada(L2_ocupada)) then
					   else	
			             if (es_expulsion_bl_modificado(expulsion_modificado)) then
				              escritura_PtX_BEX(v_bex_control); -- En el caso de expulsar un bloque modificado
					       elsif (es_expulsion_bl_lectura(expulsion_lectura)) then 
					           escritura_PtXl_BEX(v_bex_control); -- En el caso de expulsar un bloque en lectura
					       end if;
						    escritura_BDF(v_bdf_control, pet); -- Escribimos el fallo en el BDF
						end if;
						interfaces_en_CURSO(v_resp);
								      
				when ABDF =>
			        if (van_mismo_cont_L2(mismo_cont_L2)) then -- En el caso de que vayan al mismo contenedor de L2, simplemente forzamos la expulsion
					      peticion_arbitraje_con_exp(v_pet_arb_bus);
					  else
				          if (es_expulsion_bl_modificado(expulsion_modificado)) then -- Si hay que expulsar, escribimos en el bex
				              escritura_PtX_BEX(v_bex_control);
					       elsif (es_expulsion_bl_lectura(expulsion_lectura)) then 
					           escritura_PtXl_BEX(v_bex_control);
					       end if;
					  end if;
					  activar_bit_ocupado(v_s_control_acierto); -- Se va a procesar un fallo, activamos el bit de ocupado
					  interfaces_HECHOE(v_resp);
					  recoger_identificador(v_resp, pet.identificador);
					 
				when ESC =>
				     interfaces_HECHOE(v_resp);
					  recoger_identificador(v_resp, pet.identificador);
					  
				when LEC =>
				     interfaces_HECHOL(v_resp);
					  recoger_identificador(v_resp, pet.identificador);
				
		 end case;
						    
   end if;
	
   s_control_acierto <= v_s_control_acierto after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
   bex_control <= v_bex_control after retardo_logica_salida;	
	pet_arb_camino <= v_pet_arb_camino after retardo_logica_salida;
	pet_arb_bus <= v_pet_arb_bus after retardo_logica_salida;
	bdf_control <= v_bdf_control after retardo_logica_salida;
	pet_L2 <= v_pet_L2 after retardo_logica_salida;
end process;

end comportamiento;