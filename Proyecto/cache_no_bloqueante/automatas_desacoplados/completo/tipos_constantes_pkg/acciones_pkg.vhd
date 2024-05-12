library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package acciones_pkg is

constant puesta_cero: std_logic:= '1'; 

---- Petición Procesador ----
constant peticion_proc: std_logic:= '1';
constant peticion_proc_ini: std_logic:= '1'; 
constant no_peticion_proc: std_logic:= '0';

---- Estado cache ----
constant resp_cache_listo: std_logic:= '1';
constant resp_cache_ocupado: std_logic:= '0';

---- Tipo de acceso ----
constant lectura : std_logic := '0';      
constant escritura : std_logic := '1';
      
---- Derechos de acceso ----
constant derechos_acceso_si : std_logic := '1';      
constant derechos_acceso_no : std_logic := '0';
constant acceso_si: std_logic:= '1';
constant acceso_no: std_logic:= '0';
constant escritura_permiso_primera_pala: st_bloque_esc := "01";
constant escritura_permiso_segunda_pala: st_bloque_esc := "10";
constant escritura_permiso_bloque: st_bloque_esc := "11";
constant escritura_no_permiso_pala: st_bloque_esc := "00";
constant escritura_no_permiso: std_logic := '0';
constant escritura_permiso: std_logic := '1';

---- Petición a Memoria ----
constant peticion_memoria_si : std_logic := '1';      
constant peticion_memoria_no : std_logic := '0';

---- Estado del contenedor (M, L, I) ----
constant contenedor_L: st_estado := "001";
constant contenedor_I: st_estado := "000";
constant contenedor_M: st_estado := "011";
constant bit_ocupado_activado: std_logic := '1';
constant bit_ocupado_desactivado: std_logic := '0';

constant expulsion_si: std_logic:= '1';
constant expulsion_no: std_logic:= '0';

---- Desde donde actualizo el contenedor ----
constant actualizar_campo_datos_desde_proc: std_logic := '0';
constant actualizar_campo_datos_desde_bus: std_logic := '1';

end package acciones_pkg;