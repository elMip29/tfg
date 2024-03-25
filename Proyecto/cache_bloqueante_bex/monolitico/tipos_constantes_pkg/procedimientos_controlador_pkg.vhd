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

function es_lectura (signal pet: tp_contro_e) return boolean;
function es_escritura (signal pet: tp_contro_e) return boolean;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean;
function memoria_lista(signal lista_mem: std_logic) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOL(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOE(variable v_resp: out tp_contro_s);

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl);

procedure por_defecto (variable v_bex_control: inout tp_cntl_bex; variable v_s_control: inout tp_contro_cam_cntl; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s);

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl);
procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl);

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl);
procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: st_estado);
procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl);
procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_cntl);

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s);
procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s);

procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl);
procedure escritura_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex);
procedure control_muxE_fallo(variable v_s_control: inout tp_contro_cam_cntl);
procedure control_muxE_expulsion(variable v_s_control: inout tp_contro_cam_cntl);

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

function es_lectura (signal pet: tp_contro_e) return boolean is
variable es_lectura: boolean:= FALSE;
begin 
   es_lectura := (pet.esc = lectura);
return (es_lectura);
end es_lectura;

function es_escritura (signal pet: tp_contro_e) return boolean is
variable es_escritura: boolean:= FALSE;
begin 
   es_escritura := (pet.esc = escritura);
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

function memoria_lista(signal lista_mem: std_logic) return boolean is 
variable mem_lista: boolean:= FALSE;
begin 
   mem_lista := (lista_mem = '1');
return (mem_lista);
end memoria_lista;

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

procedure por_defecto (variable v_bex_control: inout tp_cntl_bex; variable v_s_control: inout tp_contro_cam_cntl; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s) is
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
				CMPET => '0',
				ESC_LEC => '0');
				--exp => expulsion_no);
	v_pet_m:= (m_acc => acceso_no,
				m_pet => peticion_memoria_no,
				m_esc => escritura_no_permiso);
	v_bex_control:= (pe => escritura_no_permiso,
	                 val_PBL => '0',
						  val_ESC_LEC => '0',
						  pe_val_PBL => escritura_no_permiso,
						  pe_val_ESC_LEC => escritura_no_permiso);
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: st_estado) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_bloque_esc := escritura_permiso;
end procedure;

procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_cntl) is
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

procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl) is
begin 
   --v_s_control.exp:= expulsion_si;
	v_s_control.ESC_LEC:= expulsion_si;
end procedure;

procedure escritura_BEX(variable v_bex_control: inout tp_cntl_bex) is 
begin 
   v_bex_control.pe := escritura_permiso;
	v_bex_control.val_PBL := '1';
	v_bex_control.pe_val_PBL := '1';	                    
end procedure;

procedure invalidar_BEX(variable v_bex_control: inout tp_cntl_bex) is
begin 
   v_bex_control.val_ESC_LEC := '1';
	v_bex_control.pe_val_ESC_LEC := '1';
end procedure;

procedure control_muxE_fallo(variable v_s_control: inout tp_contro_cam_cntl) is 
begin 
   v_s_control.CMPET := '1';
end procedure;

procedure control_muxE_expulsion(variable v_s_control: inout tp_contro_cam_cntl) is 
begin 
   v_s_control.ESC_LEC := '1';
end procedure;

end package body procedimientos_controlador_pkg;

