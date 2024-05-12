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
		 mem_ocupada: in std_logic;
		 iden_pet: in integer;
		 acceso_lec: in std_logic;
		 conc_arb_bus: in std_logic;
		 conc_arb_camino: in std_logic;
		 op_LE: in std_logic; -- Senyal que indica que tipo de acceso a dado fallo (Lectura o Escritura)
		 val_BDF: in std_logic; -- Senyal validez del buffer de direccion de fallo
		 val_BC: in std_logic; -- Senyal validez buffer de carga
		 s_control_fallo: out tp_contro_cam_fallo;
		 pet_arb_bus: out tp_arb_pet;
		 pet_arb_camino: out tp_arb_recursos_pet;
		 bdf_control: out tp_cntl_bdf;
		 bc_control: out tp_cntl_bc;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end auto_fallo;

architecture comportamiento of auto_fallo is 

signal estado, prxestado: tipoestado_fallo;

begin

-- Registro estado 
reg_estado: process(reloj, pcero)
variable v_estado: tipoestado_fallo;
begin 
    if (pcero = puesta_cero) then 
	     v_estado := PBL;
	 elsif (rising_edge(reloj)) then 
	     v_estado := prxestado;
	 end if;
	 estado <= v_estado after retardo_estado;
end process;


-- Logica del proximo estado 
logica_prx_estado: process(pcero, estado, mem_ocupada, conc_arb_bus, conc_arb_camino, val_BDF, op_LE)
variable v_estado: tipoestado_fallo;
begin 
   v_estado := estado;
	if (pcero = not puesta_cero) then 
	    case estado is
					 
				when PBL => 
				    if (es_bdf_valido(val_BDF)) then 
				        if (hay_concesion_bus(conc_arb_bus)) then 
					         v_estado := ESPL;
						  end if;
					 end if;
					 
				when ESPL =>
				    if (memoria_lista(mem_ocupada)) then
					     v_estado := ABC;
					 end if;
				
				when ABC =>
				    if (hay_concesion_camino(conc_arb_camino)) then 
			           v_estado := ESB;
					 end if; 
					 
				when ESB =>
				    if (hay_concesion_camino(conc_arb_camino)) then 
				        if (es_lectura(op_LE)) then 
					         v_estado := LEC_F;
					     elsif (es_escritura(op_LE)) then 
					         v_estado := ESC_F;
						  end if;
					 end if;
					 
				when LEC_F => 
				    v_estado := PBL;
				
				when ESC_F => 
				    v_estado := PBL;
					 
       end case;
		 
	end if;
		 
	prxestado <= v_estado after retardo_logica_prx_estado;
	
end process;


-- Logica de salida
logica_salida: process(pcero, estado, mem_ocupada, conc_arb_bus, conc_arb_camino, op_LE, val_BDF, val_BC, acceso_lec, iden_pet)
variable v_s_control_fallo: tp_contro_cam_fallo;
variable v_resp: tp_contro_s;
variable v_pet_m: tp_cntl_memoria_s;
variable v_pet_arb_bus: tp_arb_pet;
variable v_pet_arb_camino: tp_arb_recursos_pet;
variable v_bdf_control: tp_cntl_bdf;
variable v_bc_control: tp_cntl_bc;

begin

   por_defecto_fallo(v_s_control_fallo, v_pet_m, v_resp, v_pet_arb_bus, v_pet_arb_camino, v_bdf_control, v_bc_control);
	if (pcero = not puesta_cero) then 
	    case estado is 
					 
				when PBL => 
				    interfaces_en_CURSO(v_resp);
					 if (es_bdf_valido(val_BDF)) then 
					     peticion_arbitraje(v_pet_arb_bus);
					     if (hay_concesion_bus(conc_arb_bus)) then 
						      peticion_memoria_lectura(v_pet_m, iden_pet);
								control_muxE_fallo(v_s_control_fallo); -- Hay que dejar pasar por el MuxE la direccion de bloque para el acceso a memoria
						  end if;
					 end if;
					 
				when ESPL =>
				    if (es_bc_valido(acceso_lec)) then -- El bloque que proviene de memoria esta disponible un ciclo antes, lo capturamos y los guardamos en el BC
					     escritura_BC(v_bc_control);
					 end if;
					 interfaces_en_CURSO(v_resp);
					 
				when ABC => 
				    if (es_bc_valido(val_BC)) then 
					     peticion_arbitraje_recursos_f(v_pet_arb_camino);
					     if (hay_concesion_camino(conc_arb_camino)) then 
					         actualizar_etiqueta(v_s_control_fallo);
						      actu_datos_desde_bus(v_s_control_fallo);
						      actualizar_dato(v_s_control_fallo);
						      if (es_lectura(op_LE)) then
						          actualizar_estado(v_s_control_fallo, contenedor_L);
						      elsif (es_escritura(op_LE)) then 
						          actualizar_estado(v_s_control_fallo, contenedor_M);
						      end if;	
						  end if;                                    
					 end if;                                        
				    interfaces_en_CURSO(v_resp);
					 
				when ESB => 
				    if (es_bdf_valido(val_BDF)) then 
					     peticion_arbitraje_recursos_f(v_pet_arb_camino); 
					     if (hay_concesion_camino(conc_arb_camino)) then 
				            if (es_lectura(op_LE)) then 
					             lectura_datos(v_s_control_fallo);
					         elsif (es_escritura(op_LE)) then 
					             actualizar_dato_palabra(v_s_control_fallo);
								end if;
								desactivar_bit_ocupado(v_s_control_fallo); -- Se desactiva el bit ocupado del contenedor. En los estados LEC_F y ESC_F se habra finalizado el fallo
								invalidar_BDF(v_bdf_control);
					         invalidar_BC(v_bc_control);
						  end if;                                      
					 end if;                                          
				    interfaces_en_CURSO(v_resp);
					  
				when LEC_F =>
				     peticion_arbitraje_recursos_f(v_pet_arb_camino);
					  if (hay_concesion_camino(conc_arb_camino)) then  
				         interfaces_HECHOL(v_resp);           
					      recoger_identificador(v_resp, iden_pet);
					  end if;
					  
				when ESC_F => 
				     peticion_arbitraje_recursos_f(v_pet_arb_camino);
					  if (hay_concesion_camino(conc_arb_camino)) then 
				         interfaces_HECHOE(v_resp);
					      recoger_identificador(v_resp, iden_pet);
					  end if;
				
		 end case;
						    
   end if;
	
	s_control_fallo <= v_s_control_fallo after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;
	pet_m <= v_pet_m after retardo_logica_salida;
	pet_arb_bus <= v_pet_arb_bus after retardo_logica_salida;
	pet_arb_camino <= v_pet_arb_camino after retardo_logica_salida;
	bdf_control <= v_bdf_control after retardo_logica_salida;
	bc_control <= v_bc_control after retardo_logica_salida;
	
end process;

end;