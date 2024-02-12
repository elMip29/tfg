library ieee;
use ieee.std_logic_1164.all;

package acciones_pkg is

constant puesta_cero: std_logic:= '1'; -- ????

---- Petición Procesador ----
constant peticion_proc: std_logic:= '1';
constant peticion_proc_ini: std_logic:= '1'; -- Tendré petición inicial???
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
constant escritura_permiso: std_logic:= '1';
constant escritura_no_permiso: std_logic:= '0';

---- Petición a Memoria ----
constant peticion_memoria_si : std_logic := '1';      
constant peticion_memoria_no : std_logic := '0';

---- Estado del contenedor (M, L, I) ----
--constant contenedor_lectura: std_logic := '01';
--constant contenedor_invalido: std_logic := '00';
--constant contenedor_modificado: std_logic := '11';
constant expulsar_bloque: std_logic:= '1';

---- Desde donde actualizo el contenedor??? ----
constant actualizar_campo_datos_desde_proc: std_logic := '0';
constant actualizar_campo_datos_desde_bus: std_logic := '1';

end package acciones_pkg;