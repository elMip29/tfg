library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.acciones_pkg.all;

package procedimientos_controlador_L2_pkg is

-- comprobacion de condiciones
function hay_peticion_L1 (signal pet_L1: tp_contro_e_L2) return boolean;  
function hay_peticion_ini_L1 (signal pet_L1: tp_contro_e_L2) return boolean;  

function es_acierto_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_fallo_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_acierto_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;
function es_fallo_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;

function es_acierto (signal derechos_acceso: std_logic) return boolean;
function es_fallo (signal derechos_acceso: std_logic) return boolean;

function es_lectura (signal pet: tp_contro_e) return boolean;
function es_escritura (signal pet: tp_contro_e) return boolean;

function es_expulsion_bl_modificado (signal expulsion_modificado: std_logic) return boolean;
function expulsion_M_L(signal estado_leido: st_estado_L2) return boolean;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean;

function es_peticion_Pt (signal pet_L1: tp_contro_e_L2) return boolean;
function es_peticion_PtX (signal pet_L1: tp_contro_e_L2) return boolean;
function es_peticion_PtXl (signal pet_L1: tp_contro_e_L2) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOL(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOE(variable v_resp: out tp_contro_s);

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl_L2);

procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl_L2; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s; 
                       variable v_s_error: out std_logic; variable v_val_bc: out std_logic);

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl_L2);
procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl_L2);

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl_L2);
procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl_L2; estado_conte: st_estado_L2);
procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl_L2);
--procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_cntl);

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s; signal identificador: integer);
procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s);

procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl_L2);

procedure validar_BC(variable v_val_bc: inout std_logic);

procedure activar_error(variable v_s_error: out std_logic);

end package procedimientos_controlador_L2_pkg;

package body procedimientos_controlador_L2_pkg is

-- comprobacion de condiciones
function hay_peticion_L1 (signal pet_L1: tp_contro_e_L2) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet_L1.acc = peticion_proc);
return (hay_peticion);
end hay_peticion_L1;   

function hay_peticion_ini_L1 (signal pet_L1: tp_contro_e_L2) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet_L1.ini = peticion_proc_ini);
return (hay_peticion);
end hay_peticion_ini_L1;   

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

function es_acierto (signal derechos_acceso: std_logic) return boolean is
variable hit: boolean:= FALSE;
begin 
   hit := (derechos_acceso = '1');
return (hit);
end es_acierto;

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

function expulsion_M_L(signal estado_leido: st_estado_L2) return boolean is
variable es_M_L: boolean:= FALSE;
begin
   es_M_L := (estado_leido = contenedor_L_L2 or estado_leido = contenedor_M_L2); 
return (es_M_L);
end expulsion_M_L;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean is
variable hay_resp: boolean:= FALSE;
begin
	hay_resp := (resp_m.m_val = '1');
return (hay_resp);
end hay_respuesta_memoria;

function es_peticion_Pt (signal pet_L1: tp_contro_e_L2) return boolean is
variable es_Pt: boolean:= FALSE;
begin 
   es_Pt := (pet_L1.acc = '1' and pet_L1.esc = '0' and pet_L1.exp = '0');
return (es_Pt);
end es_peticion_Pt;

function es_peticion_PtX (signal pet_L1: tp_contro_e_L2) return boolean is 
variable es_PtX: boolean:= FALSE;
begin 
   es_PtX := (pet_L1.acc = '1' and pet_L1.esc = '1' and pet_L1.exp = '1');
return (es_PtX);
end es_peticion_PtX;

function es_peticion_PtXl (signal pet_L1: tp_contro_e_L2) return boolean is
variable es_PtXl: boolean:= FALSE;
begin 
   es_PtXl := (pet_L1.acc = '1' and pet_L1.esc = '1' and pet_L1.exp = '0');
return (es_PtXl);
end es_peticion_PtXl;

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

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin
	v_s_control.muxB := actualizar_campo_datos_desde_bus;
end procedure;

procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl_L2; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s;
                       variable v_s_error: out std_logic; variable v_val_bc: out std_logic) is
begin
	interfaces_DES(v_resp);
	v_s_control:= (DAT_acc => acceso_no,
				DAT_esc => escritura_no_permiso,
				ET_acc => acceso_no,
				ET_esc => escritura_no_permiso,
				EST_acc => acceso_no,
				EST_esc => escritura_no_permiso,
				EST_DE => contenedor_I_L2,
				muxB => '0',
				exp => expulsion_no);
	v_pet_m:= (m_acc => acceso_no,
				m_pet => peticion_memoria_no,
				m_esc => escritura_no_permiso,
				identificador => -1);
	v_s_error := '0';
	v_val_bc := '0';
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl_L2; estado_conte: st_estado_L2) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_esc := escritura_permiso;
end procedure;

--procedure actualizar_dato_palabra (variable v_s_control: inout tp_contro_cam_cntl) is
--begin
--	v_s_control.DAT_acc := acceso_si;
--	v_s_control.DAT_palabra_esc := escritura_permiso;
--end procedure;

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
end procedure;

procedure expulsar_bloque_modificado(variable v_s_control: inout tp_contro_cam_cntl_L2) is
begin 
   v_s_control.exp:= expulsion_si;
end procedure;

procedure validar_BC(variable v_val_bc: inout std_logic) is
begin
   v_val_bc := '1';
end procedure;

procedure activar_error(variable v_s_error: out std_logic) is
begin 
   v_s_error := '1';
end procedure;

end package body procedimientos_controlador_L2_pkg;

