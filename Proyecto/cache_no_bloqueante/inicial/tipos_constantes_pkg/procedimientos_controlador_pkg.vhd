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

function es_fallo (signal derechos_acceso: std_logic) return boolean;

--function es_lectura (signal pet: tp_contro_e) return boolean;
--function es_escritura (signal pet: tp_contro_e) return boolean;
function es_lectura (signal LE: std_logic) return boolean;
function es_escritura (signal LE: std_logic) return boolean;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean;
function memoria_lista (signal ocupada_mem: std_logic) return boolean;

function hay_concesion_bus (signal conc_arb: std_logic) return boolean;
function hay_concesion_bus_bex (signal conc_arb: std_logic) return boolean;

function info_bex_valida (signal bex_val: std_logic) return boolean;

function es_forzar_exp (signal forzar_exp: std_logic) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOL(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOE(variable v_resp: out tp_contro_s);

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl);
procedure actu_dato_desde_BC (variable v_s_control_f: inout tp_contro_cam_fallo_cntl);

procedure por_defecto (variable v_bex_control: inout tp_cntl_bex; variable v_s_control: inout tp_contro_cam_acierto_cntl; variable v_s_control_f: inout tp_contro_cam_fallo_cntl; 
                       variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s; variable v_pet_arb: inout tp_arb_pet; variable v_bdf_control: inout tp_cntl_bdf; 
							  variable v_bc_control: inout tp_cntl_bc);
procedure por_defecto_bex (variable v_bex_control: inout tp_cntl_bex; variable v_s_expulsion: inout std_logic; variable v_pet_m: out tp_cntl_memoria_s;
                           variable v_pet_arb: inout tp_arb_pet);

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure lectura_datos (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure lectura_datos_f (variable v_s_control: inout tp_contro_cam_fallo_cntl);
procedure lectura_bloq_expulsado (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure lectura_bloq_expulsado_e_invalida (variable v_s_control: inout tp_contro_cam_acierto_cntl);

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_acierto_cntl; estado_conte: st_estado);
procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_acierto_cntl);

procedure actualizar_etiqueta_f (variable v_s_control: inout tp_contro_cam_fallo_cntl);
procedure actualizar_estado_f (variable v_s_control: inout tp_contro_cam_fallo_cntl; estado_conte: st_estado);
procedure actualizar_dato_f (variable v_s_control: inout tp_contro_cam_fallo_cntl);
procedure actualizar_dato_palabra_f (variable v_s_control: inout tp_contro_cam_fallo_cntl);

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s);
procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s);

--procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl);
procedure escritura_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure control_muxE_fallo(variable v_s_control: inout tp_contro_cam_fallo_cntl);
procedure control_muxE_expulsion(variable expulsion: inout std_logic);

procedure escritura_BDF (variable v_bdf_control: inout tp_cntl_bdf; signal pet: in tp_contro_e);
procedure invalidar_BDF (variable v_bdf_control: inout tp_cntl_bdf);

procedure escritura_BC (variable v_bc_control: inout tp_cntl_bc);
procedure invalidar_BC (variable v_bc_control: inout tp_cntl_bc);

procedure peticion_arbitraje_con_exp(variable v_pet_arb: inout tp_arb_pet);
procedure peticion_arbitraje(variable v_pet_arb: inout tp_arb_pet);
procedure peticion_arbitraje_bex(variable v_pet_arb: inout tp_arb_pet);

procedure activar_mux_BDF (variable v_s_control_f: inout tp_contro_cam_fallo_cntl);
procedure activar_mux_cam_fallo (variable v_s_control_f: inout tp_contro_cam_fallo_cntl);
procedure activar_mux_cam_acierto (variable v_s_control: inout tp_contro_cam_acierto_cntl);
procedure desactivar_mux_BDF (variable v_s_control: inout tp_contro_cam_acierto_cntl);

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

function es_fallo (signal derechos_acceso: std_logic) return boolean is
variable es_fallada: boolean:= FALSE;
begin 
   es_fallada := (derechos_acceso = '0');
return (es_fallada);
end es_fallo;

function es_lectura (signal LE: std_logic) return boolean is
variable es_lectura: boolean:= FALSE;
begin 
   es_lectura := (LE = lectura);
return (es_lectura);
end es_lectura;

function es_escritura (signal LE: std_logic) return boolean is
variable es_escritura: boolean:= FALSE;
begin 
   es_escritura := (LE = escritura);
return (es_escritura);
end es_escritura;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean is
variable es_expulsion: boolean:= FALSE;
begin 
   es_expulsion := (expulsion_modificado = expulsion_si);
return (es_expulsion);
end es_expulsion_bl_modificado;

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

function info_bex_valida (signal bex_val: std_logic) return boolean is 
variable valido: boolean:= FALSE;
begin 
   valido := (bex_val = '1');
return (valido);
end info_bex_valida;

function es_forzar_exp (signal forzar_exp: std_logic) return boolean is
variable forzar: boolean:= FALSE;
begin 
   forzar := (forzar_exp = '1');
return (forzar);
end es_forzar_exp;

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

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.muxB := actualizar_campo_datos_desde_bus;
end procedure;

procedure actu_dato_desde_BC (variable v_s_control_f: inout tp_contro_cam_fallo_cntl) is 
begin 
   v_s_control_f.muxB := '1';
end procedure;

procedure por_defecto (variable v_bex_control: inout tp_cntl_bex; variable v_s_control: inout tp_contro_cam_acierto_cntl; variable v_s_control_f: inout tp_contro_cam_fallo_cntl; 
                       variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s; variable v_pet_arb: inout tp_arb_pet; variable v_bdf_control: inout tp_cntl_bdf; 
							  variable v_bc_control: inout tp_cntl_bc) is
begin
	interfaces_DES(v_resp);
	v_s_control:= (DAT_acc => acceso_no,
				DAT_bloque_esc => escritura_no_permiso,
				DAT_palabra_esc => escritura_no_permiso,
				ET_acc => acceso_no,
				ET_esc => escritura_no_permiso,
				EST_acc => acceso_no,
				EST_esc => escritura_no_permiso,
				EST_DE => contenedor_I,
				muxB => '0',
				muxBDF => '0',
				muxCaminoDatos => '0');
	v_s_control_f:= (DAT_acc => acceso_no,
				DAT_bloque_esc => escritura_no_permiso,
				DAT_palabra_esc => escritura_no_permiso,
				ET_acc => acceso_no,
				ET_esc => escritura_no_permiso,
				EST_acc => acceso_no,
				EST_esc => escritura_no_permiso,
				EST_DE => contenedor_I,
				muxB => '0',
				FALLO => '0',
				muxBDF => '0',
				muxCaminoDatos => '0');
	v_pet_m:= (m_acc => acceso_no,
				m_pet => peticion_memoria_no,
				m_esc => escritura_no_permiso);
	v_bex_control:= (pe => escritura_no_permiso,
	                 val_PBL => '0',
						  val_EXP => '0',
						  pe_val_PBL => escritura_no_permiso,
						  pe_val_EXP => escritura_no_permiso);
	v_pet_arb:= (pet_arb => '0', 
	             pet_arb_exp => '0',
					 pet_bex_arb => '0');
	v_bdf_control:= (pe_bdf => escritura_no_permiso,
                    esc => '0',
						  validez_bdf => '0',
						  pe_val_bdf => escritura_no_permiso);
	v_bc_control:= (invalidar_bc => '0', 
                   pe_val_bc => '0');
					 
end procedure;

procedure por_defecto_bex (variable v_bex_control: inout tp_cntl_bex; variable v_s_expulsion: inout std_logic; variable v_pet_m: out tp_cntl_memoria_s; 
                       variable v_pet_arb: inout tp_arb_pet) is
begin 
   v_s_expulsion := '0';
	v_pet_m:= (m_acc => acceso_no,
				m_pet => peticion_memoria_no,
				m_esc => escritura_no_permiso);
	v_bex_control:= (pe => escritura_no_permiso,
	                 val_PBL => '0',
						  val_EXP => '0',
						  pe_val_PBL => escritura_no_permiso,
						  pe_val_EXP => escritura_no_permiso);
	v_pet_arb:= (pet_arb => '0', 
	             pet_arb_exp => '0',
					 pet_bex_arb => '0');
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;

procedure lectura_datos_f (variable v_s_control: inout tp_contro_cam_fallo_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;

procedure lectura_bloq_expulsado (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin 
   v_s_control.DAT_acc := acceso_si;
end procedure;

procedure lectura_bloq_expulsado_e_invalida (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin 
   v_s_control.DAT_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := contenedor_I;
end procedure;

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_acierto_cntl; estado_conte: st_estado) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_bloque_esc := escritura_permiso;
end procedure;

procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_palabra_esc := escritura_permiso;
end procedure;

procedure actualizar_etiqueta_f (variable v_s_control: inout tp_contro_cam_fallo_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado_f (variable v_s_control: inout tp_contro_cam_fallo_cntl; estado_conte: st_estado) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato_f (variable v_s_control: inout tp_contro_cam_fallo_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_bloque_esc := escritura_permiso;
end procedure;

procedure actualizar_dato_palabra_f (variable v_s_control: inout tp_contro_cam_fallo_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_palabra_esc := escritura_permiso;
end procedure;

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s) is
begin
	v_pet_m:= (m_acc => '1',
			m_pet => peticion_memoria_si,
			m_esc => escritura_no_permiso);
end procedure;

procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s) is
begin
	v_pet_m:= (m_acc => '1',
			m_pet => peticion_memoria_si,
			m_esc => escritura_permiso);
end procedure;

--procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl) is
--begin 
--   --v_s_control.exp:= expulsion_si;
--	v_s_control.ESC_LEC:= expulsion_si;
--end procedure;

procedure escritura_BEX(variable v_bex_control: inout tp_cntl_bex) is 
begin 
   v_bex_control.pe := escritura_permiso;
	v_bex_control.val_PBL := '1';
	v_bex_control.pe_val_PBL := '1';	                    
end procedure;

procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex) is
begin 
   v_bex_control.val_EXP := '1';
	v_bex_control.pe_val_EXP := '1';
end procedure;

procedure control_muxE_fallo(variable v_s_control: inout tp_contro_cam_fallo_cntl) is 
begin 
   v_s_control.FALLO := '1';
end procedure;

procedure control_muxE_expulsion(variable expulsion: inout std_logic) is 
begin 
   expulsion := '1';
end procedure;

procedure escritura_BDF (variable v_bdf_control: inout tp_cntl_bdf; signal pet: in tp_contro_e) is 
begin 
   v_bdf_control.pe_bdf := escritura_permiso;
	v_bdf_control.esc := pet.esc;
	v_bdf_control.validez_bdf := '1';
	v_bdf_control.pe_val_bdf := escritura_permiso;
end procedure;

procedure invalidar_BDF (variable v_bdf_control: inout tp_cntl_bdf) is
begin 
   v_bdf_control.validez_bdf := '0';
	v_bdf_control.pe_val_bdf := escritura_permiso;
end procedure;

procedure escritura_BC (variable v_bc_control: inout tp_cntl_bc) is 
begin 
   v_bc_control.pe_val_bc := escritura_permiso;
end procedure;

procedure invalidar_BC (variable v_bc_control: inout tp_cntl_bc) is 
begin 
   v_bc_control.invalidar_bc := '1';
	v_bc_control.pe_val_bc := escritura_permiso;
end procedure;

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

procedure activar_mux_BDF (variable v_s_control_f: inout tp_contro_cam_fallo_cntl) is 
begin 
   v_s_control_f.muxBDF := '1';
end procedure;

procedure activar_mux_cam_fallo (variable v_s_control_f: inout tp_contro_cam_fallo_cntl) is
begin 
   v_s_control_f.muxCaminoDatos := '1';
end procedure;

procedure activar_mux_cam_acierto (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin 
   v_s_control.muxCaminoDatos := '0';
end procedure;

procedure desactivar_mux_BDF (variable v_s_control: inout tp_contro_cam_acierto_cntl) is
begin 
   v_s_control.muxBDF := '0';
end procedure;

end package body procedimientos_controlador_pkg;

