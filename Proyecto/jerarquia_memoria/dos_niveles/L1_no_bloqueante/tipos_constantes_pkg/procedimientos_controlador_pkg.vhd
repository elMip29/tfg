library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.acciones_pkg.all;

package procedimientos_controlador_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean;  
function hay_peticion_ini_procesador (signal pet: tp_contro_e) return boolean;  

function es_acierto_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_fallo_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_acierto_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;
function es_fallo_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;

function es_fallo_secundario (signal fallo_sec: std_logic) return boolean;

function es_acierto (signal derechos_acceso: std_logic) return boolean;
function es_fallo (signal derechos_acceso: std_logic) return boolean;

function es_lectura (signal op_LE: std_logic) return boolean;
function es_escritura (signal op_LE: std_logic) return boolean;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean;
function es_expulsion_bl_lectura(signal expulsion_lectura: std_logic) return boolean;
function es_exp_PtXl(signal expulsion_lectura: std_logic) return boolean;


function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean;
function memoria_lista (signal ocupada_mem: std_logic) return boolean;

function hay_concesion_bus (signal conc_arb: std_logic) return boolean;
function hay_concesion_bus_bex (signal conc_arb: std_logic) return boolean;
function hay_concesion_camino (signal conc_arb: std_logic) return boolean;

function info_bex_valida (signal bex_val: std_logic) return boolean;
function es_bdf_valido (signal bdf_val: std_logic) return boolean;
function es_bc_valido (signal bc_val: std_logic) return boolean;

function es_forzar_exp (signal forzar_exp: std_logic) return boolean;

function es_peticion_Pt (signal pet_L1: tp_cntl_L2_s) return boolean;
function es_peticion_PtX (signal pet_L1: tp_cntl_L2_s) return boolean;
function es_peticion_PtXl (signal pet_L1: tp_cntl_L2_s) return boolean;

function esta_L2_ocupada(signal L2_ocupada: std_logic) return boolean;
function hay_respuesta_L2(signal resp_L2: std_logic) return boolean;
function van_mismo_cont_L2(signal mismo_cont_L2: std_logic) return boolean;

function esta_contenedor_ocupado (signal contenedor_ocupado: std_logic) return boolean;

function hay_lectura_ET_EST (signal lec_ET_EST: std_logic) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOL(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOE(variable v_resp: out tp_contro_s);

procedure recoger_identificador(variable v_resp: out tp_contro_s; signal iden: integer);

procedure actu_datos_desde_bus (variable v_s_control_fallo: inout tp_contro_cam_fallo);

procedure por_defecto_acceso (variable v_bex_control: inout tp_cntl_bex; variable v_s_control_acierto: inout tp_contro_cam_acceso;  
                              variable v_resp: out tp_contro_s; variable v_pet_arb_camino: inout tp_arb_recursos_pet; variable v_pet_arb_bus: inout tp_arb_pet; 
										variable v_bdf_control: inout tp_cntl_bdf; variable v_pet_L2: inout tp_cntl_L2_s);
										
procedure por_defecto_fallo (variable v_s_control_fallo: inout tp_contro_cam_fallo; variable v_pet_L2: out tp_cntl_L2_s; variable v_resp: out tp_contro_s; 
                             variable v_pet_arb_bus: inout tp_arb_pet; variable v_pet_arb_camino: inout tp_arb_recursos_pet; variable v_bdf_control: inout tp_cntl_bdf;
									  variable v_bc_control: inout tp_cntl_bc);
										
procedure por_defecto_bex (variable v_bex_control: inout tp_cntl_bex; variable v_s_expulsion: inout std_logic; variable v_pet_L2: out tp_cntl_L2_s;
                           variable v_pet_arb: inout tp_arb_pet);

procedure lectura_etiq_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure lectura_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure lectura_datos (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure lectura_datos (variable v_s_control_fallo: inout tp_contro_cam_fallo);
procedure lectura_bloq_expulsado (variable v_s_control_acierto: inout tp_contro_cam_acceso);

procedure invalidar_bloque(variable v_s_control_acierto: inout tp_contro_cam_acceso);

procedure actualizar_etiqueta (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure actualizar_etiqueta (variable v_s_control_fallo: inout tp_contro_cam_fallo);
procedure actualizar_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso; estado_conte: st_estado);
procedure actualizar_estado (variable v_s_control_fallo: inout tp_contro_cam_fallo; estado_conte: st_estado);
procedure actualizar_dato (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure actualizar_dato (variable v_s_control_fallo: inout tp_contro_cam_fallo);
procedure actualizar_dato_palabra (variable v_s_control_fallo: inout tp_contro_cam_fallo);
procedure actualizar_dato_palabra (variable v_s_control_acierto: inout tp_contro_cam_acceso);

procedure activar_bit_ocupado (variable v_s_control_acierto: inout tp_contro_cam_acceso);
procedure desactivar_bit_ocupado (variable v_s_control_fallo: inout tp_contro_cam_fallo);

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s; signal identificador: integer);
procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s);

--procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl);
procedure escritura_PtX_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure escritura_PtXl_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure control_muxE_fallo(variable v_s_control_fallo: inout tp_contro_cam_fallo);
procedure control_muxE_expulsion(variable expulsion: inout std_logic);

procedure escritura_BDF(variable v_bdf_control: inout tp_cntl_bdf; signal pet: in tp_contro_e);
procedure invalidar_BDF(variable v_bdf_control: inout tp_cntl_bdf);
procedure escritura_BC(variable v_bc_control: inout tp_cntl_bc);
procedure invalidar_BC(variable v_bc_control: inout tp_cntl_bc);
procedure esc_regAsociadoBC(variable v_pe_regAsociadoBC: inout std_logic);

--procedure activar_muxBDF(variable v_s_control_fallo: inout tp_contro_cam_fallo);

procedure peticion_arbitraje_con_exp(variable v_pet_arb: inout tp_arb_pet);
procedure peticion_arbitraje(variable v_pet_arb: inout tp_arb_pet);
procedure peticion_arbitraje_bex(variable v_pet_arb: inout tp_arb_pet);
procedure peticion_arbitraje_recursos(variable v_pet_arb: inout tp_arb_recursos_pet);
procedure peticion_arbitraje_recursos_f(variable v_pet_arb: inout tp_arb_recursos_pet);

procedure enviar_inicio_L2(variable v_pet_L2: inout tp_cntl_L2_s);
procedure enviar_pet_Pt(variable v_pet_L2: inout tp_cntl_L2_s; signal iden: integer);
procedure enviar_pet_PtXl(variable v_pet_L2: inout tp_cntl_L2_s);
procedure enviar_pet_PtX(variable v_pet_L2: inout tp_cntl_L2_s);

--procedure activar_muxCache(variable v_s_control_fallo: inout tp_contro_cam_fallo);

procedure avisar_controlador_acceso(variable v_lec_ET_EST: inout std_logic);
procedure mantener_peticion (variable v_peticion_pendiente: inout std_logic);

end package procedimientos_controlador_pkg;

package body procedimientos_controlador_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = peticion_proc);
return (hay_peticion);
end hay_peticion_procesador;   

function hay_peticion_ini_procesador (signal pet: tp_contro_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.ini = peticion_proc_ini);
return (hay_peticion);
end hay_peticion_ini_procesador;   

function es_acierto_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = lectura and derechos_acceso = derechos_acceso_si);
return (es_acierto);
end es_acierto_lectura;   

function es_fallo_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_fallo: boolean:= FALSE;
begin
	es_fallo := (pet.esc = lectura and derechos_acceso = derechos_acceso_no);
return (es_fallo);
end es_fallo_lectura;  

function es_acierto_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = escritura and derechos_acceso = derechos_acceso_si);
return (es_acierto);
end es_acierto_escritura;

function es_fallo_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_fallo: boolean:= FALSE;
begin
	es_fallo := (pet.esc = escritura and derechos_acceso = derechos_acceso_no);
return (es_fallo);
end es_fallo_escritura;

function es_fallo_secundario (signal fallo_sec: std_logic) return boolean is 
variable es_fallo_sec: boolean:= FALSE;
begin 
   es_fallo_sec := (fallo_sec = '1');
return (es_fallo_sec);
end es_fallo_secundario;

function es_acierto (signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin 
   es_acierto := (derechos_acceso = '1');
return (es_acierto);
end es_acierto;

function es_fallo (signal derechos_acceso: std_logic) return boolean is
variable es_fallada: boolean:= FALSE;
begin 
   es_fallada := (derechos_acceso = '0');
return (es_fallada);
end es_fallo;

function es_lectura (signal op_LE: std_logic) return boolean is
variable es_lectura: boolean:= FALSE;
begin 
   es_lectura := (op_LE = lectura);
return (es_lectura);
end es_lectura;

function es_escritura (signal op_LE: std_logic) return boolean is
variable es_escritura: boolean:= FALSE;
begin 
   es_escritura := (op_LE = escritura);
return (es_escritura);
end es_escritura;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean is
variable es_expulsion: boolean:= FALSE;
begin 
   es_expulsion := (expulsion_modificado = expulsion_si);
return (es_expulsion);
end es_expulsion_bl_modificado;

function es_expulsion_bl_lectura(signal expulsion_lectura: std_logic) return boolean is
variable es_expulsion: boolean:= FALSE;
begin 
   es_expulsion := (expulsion_lectura = expulsion_si);
return (es_expulsion);
end es_expulsion_bl_lectura;

function es_exp_PtXl(signal expulsion_lectura: std_logic) return boolean is
variable es_expulsion: boolean:= FALSE;
begin 
   es_expulsion := (expulsion_lectura = '0');
return (es_expulsion);
end es_exp_PtXl;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean is
variable hay_resp: boolean:= FALSE;
begin
	hay_resp := (resp_m.m_val = '1');
return (hay_resp);
end hay_respuesta_memoria;

function memoria_lista(signal ocupada_mem: std_logic) return boolean is 
variable mem_lista: boolean:= FALSE;
begin 
   mem_lista := (ocupada_mem = '0');
return (mem_lista);
end memoria_lista;

function hay_concesion_bus(signal conc_arb: std_logic) return boolean is 
variable concesion: boolean:= FALSE;
begin 
   concesion := (conc_arb = '1');
return (concesion);
end hay_concesion_bus;

function hay_concesion_bus_bex (signal conc_arb: std_logic) return boolean is
variable concesion: boolean:= FALSE;
begin 
   concesion := (conc_arb = '1');
return (concesion);
end hay_concesion_bus_bex;

function hay_concesion_camino (signal conc_arb: std_logic) return boolean is
variable concesion: boolean:= FALSE;
begin 
   concesion := (conc_arb = '1');
return (concesion);
end hay_concesion_camino;

function info_bex_valida (signal bex_val: std_logic) return boolean is 
variable valido: boolean:= FALSE;
begin 
   valido := (bex_val = '1');
return (valido);
end info_bex_valida;

function es_bdf_valido (signal bdf_val: std_logic) return boolean is
variable valido: boolean:= FALSE;
begin 
   valido := (bdf_val = '1');
return (valido);
end es_bdf_valido;

function es_bc_valido (signal bc_val: std_logic) return boolean is
variable valido: boolean:= FALSE;
begin 
   valido := (bc_val = '1');
return (valido);
end es_bc_valido;

function es_forzar_exp (signal forzar_exp: std_logic) return boolean is
variable forzar: boolean:= FALSE;
begin 
   forzar := (forzar_exp = '1');
return (forzar);
end es_forzar_exp;

function es_peticion_Pt (signal pet_L1: tp_cntl_L2_s) return boolean is
variable es_Pt: boolean:= FALSE;
begin 
   es_Pt := (pet_L1.l2_acc = '1' and pet_L1.l2_esc = '0' and pet_L1.l2_exp = '0');
return (es_Pt);
end es_peticion_Pt;
	
function es_peticion_PtX (signal pet_L1: tp_cntl_L2_s) return boolean is 
variable es_PtX: boolean:= FALSE;
begin 
   es_PtX := (pet_L1.l2_acc = '1' and pet_L1.l2_esc = '1' and pet_L1.l2_exp = '1');
return (es_PtX);
end es_peticion_PtX;
	
function es_peticion_PtXl (signal pet_L1: tp_cntl_L2_s) return boolean is
variable es_PtXl: boolean:= FALSE;
begin 
   es_PtXl := (pet_L1.l2_acc = '1' and pet_L1.l2_esc = '0' and pet_L1.l2_exp = '1');
return (es_PtXl);
end es_peticion_PtXl;
	
function esta_L2_ocupada(signal L2_ocupada: std_logic) return boolean is
variable esta_lista: boolean:= FALSE;
begin 
   esta_lista := (L2_ocupada = '1');
return (esta_lista);
end esta_L2_ocupada;
	
function hay_respuesta_L2(signal resp_L2: std_logic) return boolean is 
variable hay_resp: boolean:= FALSE;
begin 
   hay_resp := (resp_L2 = '1');
return (hay_resp);
end hay_respuesta_L2;
	
function van_mismo_cont_L2(signal mismo_cont_L2: std_logic) return boolean is
variable mismo_contenedor: boolean:= FALSE;
begin 
   mismo_contenedor := (mismo_cont_L2 = '1');
return (mismo_contenedor);
end van_mismo_cont_L2;

function hay_lectura_ET_EST (signal lec_ET_EST: std_logic) return boolean is
variable lectura: boolean:= FALSE;
begin
   lectura := (lec_ET_EST = '1');
return (lectura);
end hay_lectura_ET_EST;

function esta_contenedor_ocupado (signal contenedor_ocupado: std_logic) return boolean is
variable ocupado: boolean:= FALSE;
begin
   ocupado := (contenedor_ocupado = '1');
return (ocupado);
end esta_contenedor_ocupado;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_listo;
end procedure;

procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure interfaces_HECHOL(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '1';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure interfaces_HECHOE(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure recoger_identificador(variable v_resp: out tp_contro_s; signal iden: integer) is
begin
  v_resp.identificador := iden;
end procedure;

procedure actu_datos_desde_bus (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin
	v_s_control_fallo.muxB := actualizar_campo_datos_desde_bus;
end procedure;

procedure por_defecto_acceso (variable v_bex_control: inout tp_cntl_bex; variable v_s_control_acierto: inout tp_contro_cam_acceso; 
                              variable v_resp: out tp_contro_s; variable v_pet_arb_camino: inout tp_arb_recursos_pet; variable v_pet_arb_bus: inout tp_arb_pet;
										variable v_bdf_control: inout tp_cntl_bdf; variable v_pet_L2: inout tp_cntl_L2_s) is
begin
	interfaces_DES(v_resp);
	v_s_control_acierto:= (DAT_acc => acceso_no,
				              DAT_bloque_esc => escritura_no_permiso,
				              DAT_palabra_esc => escritura_no_permiso,
				              ET_acc => acceso_no,
				              ET_esc => escritura_no_permiso,
				              EST_acc => acceso_no,
				              EST_esc => escritura_no_permiso,
								  EST_esc_ocupado => escritura_no_permiso,
				              EST_DE => contenedor_I);
	v_bex_control:= (pe => escritura_no_permiso,
	                 val_PBL => '0',
						  val_EXP => '0',
						  pe_val_PBL => escritura_no_permiso,
						  pe_val_EXP => escritura_no_permiso,
						  tipo_exp => '0');
	v_pet_arb_camino:= (pet_arb_acceso => '0', 
	                    pet_arb_fallo => '0');
	v_pet_arb_bus:= (pet_arb => '0', 
	                 pet_arb_exp => '0', 
						  pet_bex_arb => '0');
	v_bdf_control:= (pe_bdf => escritura_no_permiso,
                    esc => '0',
						  validez_bdf => '0',
						  pe_val_bdf => escritura_no_permiso);
   v_pet_L2:= (l2_acc => acceso_no,
				   l2_pet => peticion_memoria_no,
				   l2_esc => escritura_no_permiso,
				   l2_exp => '0',
				   l2_ini => '0',
					identificador => -1);
end procedure;

procedure por_defecto_fallo (variable v_s_control_fallo: inout tp_contro_cam_fallo; variable v_pet_L2: out tp_cntl_L2_s; variable v_resp: out tp_contro_s; 
                             variable v_pet_arb_bus: inout tp_arb_pet; variable v_pet_arb_camino: inout tp_arb_recursos_pet; variable v_bdf_control: inout tp_cntl_bdf;
									  variable v_bc_control: inout tp_cntl_bc) is 
begin 
   interfaces_DES(v_resp);
   v_s_control_fallo:= (DAT_acc => acceso_no,
				            DAT_bloque_esc => escritura_no_permiso,
				            DAT_palabra_esc => escritura_no_permiso,
				            ET_acc => acceso_no,
				            ET_esc => escritura_no_permiso,
				            EST_acc => acceso_no,
				            EST_esc => escritura_no_permiso,
								EST_esc_ocupado => escritura_no_permiso,
				            EST_DE => contenedor_I,
				            FALLO => '0',
								muxB => '0');
   v_pet_L2:= (l2_acc => acceso_no,
				   l2_pet => peticion_memoria_no,
				   l2_esc => escritura_no_permiso,
				   l2_exp => '0',
				   l2_ini => '0',
					identificador => -1);
	v_pet_arb_bus:= (pet_arb => '0', 
	                 pet_arb_exp => '0', 
						  pet_bex_arb => '0');
	v_pet_arb_camino:= (pet_arb_acceso => '0', 
	                    pet_arb_fallo => '0');
	v_bdf_control:= (pe_bdf => escritura_no_permiso,
                    esc => '0',
						  validez_bdf => '0',
						  pe_val_bdf => escritura_no_permiso);
	v_bc_control:= (validez_bc => '0',
	                pe_bc => escritura_no_permiso,
	                pe_val_bc => escritura_no_permiso);
end procedure;

procedure por_defecto_bex (variable v_bex_control: inout tp_cntl_bex; variable v_s_expulsion: inout std_logic; variable v_pet_L2: out tp_cntl_L2_s; 
                       variable v_pet_arb: inout tp_arb_pet) is
begin 
   v_s_expulsion := '0';
	v_pet_L2:= (l2_acc => acceso_no,
				   l2_pet => peticion_memoria_no,
				   l2_esc => escritura_no_permiso,
				   l2_exp => '0',
				   l2_ini => '0',
					identificador => -1);
	v_bex_control:= (pe => escritura_no_permiso,
	                 val_PBL => '0',
						  val_EXP => '0',
						  pe_val_PBL => escritura_no_permiso,
						  pe_val_EXP => escritura_no_permiso,
						  tipo_exp => '0');
	v_pet_arb:= (pet_arb => '0', 
	             pet_arb_exp => '0',
					 pet_bex_arb => '0');
end procedure;

procedure lectura_etiq_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin
	v_s_control_acierto.ET_acc := acceso_si;
	v_s_control_acierto.EST_acc := acceso_si;
end procedure;

procedure lectura_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso) is 
begin 
   v_s_control_acierto.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin
	v_s_control_acierto.DAT_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin
	v_s_control_fallo.DAT_acc := acceso_si;
end procedure;

procedure lectura_bloq_expulsado (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin 
   v_s_control_acierto.DAT_acc := acceso_si;
end procedure;

procedure invalidar_bloque(variable v_s_control_acierto: inout tp_contro_cam_acceso) is 
begin 
   v_s_control_acierto.EST_acc := acceso_si;
	v_s_control_acierto.EST_esc := escritura_permiso;
	v_s_control_acierto.EST_DE := contenedor_I;
end procedure;

procedure actualizar_etiqueta (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin
	v_s_control_acierto.ET_acc := acceso_si;
	v_s_control_acierto.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_etiqueta (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin
	v_s_control_fallo.ET_acc := acceso_si;
	v_s_control_fallo.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado (variable v_s_control_acierto: inout tp_contro_cam_acceso; estado_conte: st_estado) is
begin
	v_s_control_acierto.EST_acc := acceso_si;
	v_s_control_acierto.EST_esc := escritura_permiso;
	v_s_control_acierto.EST_DE := estado_conte;
end procedure;

procedure actualizar_estado (variable v_s_control_fallo: inout tp_contro_cam_fallo; estado_conte: st_estado) is
begin
	v_s_control_fallo.EST_acc := acceso_si;
	v_s_control_fallo.EST_esc := escritura_permiso;
	v_s_control_fallo.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin
	v_s_control_acierto.DAT_acc := acceso_si;
	v_s_control_acierto.DAT_bloque_esc := escritura_permiso;
end procedure;

procedure actualizar_dato (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin
	v_s_control_fallo.DAT_acc := acceso_si;
	v_s_control_fallo.DAT_bloque_esc := escritura_permiso;
end procedure;

procedure actualizar_dato_palabra (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin
	v_s_control_acierto.DAT_acc := acceso_si;
	v_s_control_acierto.DAT_palabra_esc := escritura_permiso;
end procedure;

procedure activar_bit_ocupado (variable v_s_control_acierto: inout tp_contro_cam_acceso) is
begin 
  v_s_control_acierto.EST_acc := acceso_si;
  v_s_control_acierto.EST_esc_ocupado := escritura_permiso;
  v_s_control_acierto.EST_DE := (2 => '1', others => '0');
end procedure;

procedure desactivar_bit_ocupado (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin 
  v_s_control_fallo.EST_acc := acceso_si;
  v_s_control_fallo.EST_esc_ocupado := escritura_permiso;
  v_s_control_fallo.EST_DE := (2 => '0', others => '0');
end procedure;

procedure actualizar_dato_palabra (variable v_s_control_fallo: inout tp_contro_cam_fallo) is
begin
	v_s_control_fallo.DAT_acc := acceso_si;
	v_s_control_fallo.DAT_palabra_esc := escritura_permiso;
end procedure;

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s; signal identificador: integer) is
begin
	v_pet_m:= (m_acc => '1',
			m_pet => peticion_memoria_si,
			m_esc => escritura_no_permiso, 
			identificador => identificador);
end procedure;

procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s) is
begin
   v_pet_m.m_acc := '1';
	v_pet_m.m_pet := peticion_memoria_si;
	v_pet_m.m_esc := escritura_permiso;
--	v_pet_m:= (m_acc => '1',
--			m_pet => peticion_memoria_si,
--			m_esc => escritura_permiso);
end procedure;

--procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl) is
--begin 
--   --v_s_control.exp:= expulsion_si;
--	v_s_control.ESC_LEC:= expulsion_si;
--end procedure;

procedure escritura_PtX_BEX(variable v_bex_control: inout tp_cntl_bex) is 
begin 
   v_bex_control.pe := escritura_permiso;
	v_bex_control.val_PBL := '1';
	v_bex_control.pe_val_PBL := '1';
   v_bex_control.tipo_exp := '1';	
end procedure;

procedure escritura_PtXl_BEX(variable v_bex_control: inout tp_cntl_bex) is 
begin 
   v_bex_control.pe := escritura_permiso;
	v_bex_control.val_PBL := '1';
	v_bex_control.pe_val_PBL := '1';
   v_bex_control.tipo_exp := '0';	
end procedure;

procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex) is
begin 
   v_bex_control.val_EXP := '1';
	v_bex_control.pe_val_EXP := '1';
end procedure;

procedure control_muxE_fallo(variable v_s_control_fallo: inout tp_contro_cam_fallo) is 
begin 
   v_s_control_fallo.FALLO := '1';
end procedure;

procedure control_muxE_expulsion(variable expulsion: inout std_logic) is 
begin 
   expulsion := '1';
end procedure;

procedure escritura_BDF(variable v_bdf_control: inout tp_cntl_bdf; signal pet: in tp_contro_e) is 
begin 
   v_bdf_control.pe_bdf := '1';
	v_bdf_control.validez_bdf := '1';
	v_bdf_control.pe_val_bdf := '1';
	v_bdf_control.esc := pet.esc;
end procedure;

procedure invalidar_BDF(variable v_bdf_control: inout tp_cntl_bdf) is 
begin
   v_bdf_control.pe_val_bdf := '1';
   v_bdf_control.validez_bdf := '0';	
end procedure;

procedure escritura_BC(variable v_bc_control: inout tp_cntl_bc) is 
begin
   v_bc_control.pe_val_bc := '1'; 
	v_bc_control.pe_bc := '1';
end procedure;

procedure invalidar_BC(variable v_bc_control: inout tp_cntl_bc) is
begin 
   v_bc_control.pe_val_bc := '1';
	v_bc_control.validez_bc := '0';
end procedure;

procedure esc_regAsociadoBC(variable v_pe_regAsociadoBC: inout std_logic) is 
begin 
   v_pe_regAsociadoBC := '1';
end procedure;

--procedure activar_muxBDF(variable v_s_control_fallo: inout tp_contro_cam_fallo) is 
--begin
--   v_s_control_fallo.muxBDF_fallo := '1';
--end procedure;

procedure peticion_arbitraje_bex(variable v_pet_arb: inout tp_arb_pet) is 
begin 
   v_pet_arb.pet_bex_arb := '1';
end procedure;

procedure peticion_arbitraje_con_exp(variable v_pet_arb: inout tp_arb_pet) is
begin 
   v_pet_arb.pet_arb := '1';
	v_pet_arb.pet_arb_exp := '1';
end procedure;

procedure peticion_arbitraje(variable v_pet_arb: inout tp_arb_pet) is
begin
   v_pet_arb.pet_arb := '1'; 
end procedure;

procedure peticion_arbitraje_recursos(variable v_pet_arb: inout tp_arb_recursos_pet) is 
begin 
   v_pet_arb.pet_arb_acceso := '1';
end procedure;

procedure peticion_arbitraje_recursos_f(variable v_pet_arb: inout tp_arb_recursos_pet) is
begin 
   v_pet_arb.pet_arb_fallo := '1';
end procedure;

--procedure activar_muxCache(variable v_s_control_fallo: inout tp_contro_cam_fallo) is 
--begin 
--   v_s_control_fallo.muxCache := '1';
--end procedure;

procedure enviar_inicio_L2(variable v_pet_L2: inout tp_cntl_L2_s) is
begin
   v_pet_L2.l2_acc := '1';
   v_pet_L2.l2_ini := '1';
end procedure;
	
procedure enviar_pet_Pt(variable v_pet_L2: inout tp_cntl_L2_s; signal iden: integer) is
begin 
   v_pet_L2.l2_acc := '1';
	v_pet_L2.l2_pet := '1';
	v_pet_L2.l2_esc := escritura_no_permiso;
	v_pet_L2.l2_exp := '0';
	v_pet_L2.identificador := iden;
end procedure;
	
procedure enviar_pet_PtXl(variable v_pet_L2: inout tp_cntl_L2_s) is
begin 
   v_pet_L2.l2_acc := '1';
	v_pet_L2.l2_pet := '1';
	v_pet_L2.l2_esc := escritura_permiso;
	v_pet_L2.l2_exp := '0';
end procedure;
	
procedure enviar_pet_PtX(variable v_pet_L2: inout tp_cntl_L2_s) is
begin 
   v_pet_L2.l2_acc := '1';
	v_pet_L2.l2_pet := '1';
	v_pet_L2.l2_esc := escritura_permiso;
	v_pet_L2.l2_exp := '1';
end procedure;

procedure avisar_controlador_acceso(variable v_lec_ET_EST: inout std_logic) is
begin 
   v_lec_ET_EST := '1';
end procedure;

procedure mantener_peticion (variable v_peticion_pendiente: inout std_logic) is
begin 
   v_peticion_pendiente := '1';
end procedure;

end package body procedimientos_controlador_pkg;

