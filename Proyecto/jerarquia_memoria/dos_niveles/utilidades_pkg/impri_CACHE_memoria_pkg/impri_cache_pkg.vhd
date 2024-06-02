library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use IEEE.std_logic_textio.all;

use work.param_disenyo_pkg.all;

package impri_cache_pkg is
procedure cabecera_memoria(fichero: in string);
procedure cabecera_memoria_L2(fichero: in string);
procedure imprimir(i:in integer; etiqLeido: in st_etiqueta; estadoLeido: in st_estado; datoLeido: in st_bloque_dat; fichero: in string);
procedure imprimir_L2(i:in integer; etiqLeido: in st_etiqueta_L2; estadoLeido: in st_estado_L2; datoLeido: in st_bloque_dat; fichero: in string);
procedure imprimir_puntos(fichero: in string);
procedure impri_cache(mem_etiq: in tp_m_ET; mem_estado: in tp_m_EST; mem_datos: in tp_m_DAT; fichero: in string);
procedure impri_cache_L2(mem_etiq: in tp_m_ET_L2; mem_estado: in tp_m_EST_L2; mem_datos: in tp_m_DAT_L2; fichero: in string);

end package impri_cache_pkg;

package body impri_cache_pkg is

procedure cabecera_memoria(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,append_mode); 
	write (linea_S, string'(LF & CR & " Contenido de la cache L1. Informacion en hexadecimal o binario" & LF & CR)); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido de la cache L1. Informacion en hexadecimal o binario" & LF & CR));
	writeline(output, l);

	write (l, string'("Numero"& LF));
	write (l, string'("Contenedor      Estado"& LF));
	write (l, string'("Etiqueta      Datos"& LF), right, 27);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure cabecera_memoria;

procedure cabecera_memoria_L2(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,append_mode); 
	write (linea_S, string'(LF & CR & " Contenido de la cache L2. Informacion en hexadecimal o binario" & LF & CR)); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido de la cache L2. Informacion en hexadecimal o binario" & LF & CR));
	writeline(output, l);

	write (l, string'("Numero"& LF));
	write (l, string'("Contenedor      Estado"& LF));
	write (l, string'("Etiqueta      Datos"& LF), right, 27);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure cabecera_memoria_L2;

procedure imprimir(i:in integer; etiqLeido: in st_etiqueta; estadoLeido: in st_estado; datoLeido: in st_bloque_dat; fichero: in string)is
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	hwrite(l, std_logic_vector(to_unsigned(i,log_num_conjuntos)), right, 8);
	hwrite(l, etiqLeido, right, 6); 
	write(l, estadoLeido, right, 4);
	hwrite(l, datoLeido, right, 6); 
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir;

procedure imprimir_L2(i:in integer; etiqLeido: in st_etiqueta_L2; estadoLeido: in st_estado_L2; datoLeido: in st_bloque_dat; fichero: in string) IS
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	hwrite(l, std_logic_vector(to_unsigned(i,log_num_conjuntos_L2)), right, 8);
	hwrite(l, etiqLeido, right, 6); 
	write(l, estadoLeido, right, 4);
	hwrite(l, datoLeido, right, 6); 
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_L2;

procedure imprimir_puntos(fichero: in string)is
file S: text;
variable linea_S : line;
variable l : line;
begin
	write(l, string'(" . . . . . . . . ."));
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_puntos;

procedure impri_cache (mem_etiq: in tp_m_ET; mem_estado: in tp_m_EST; mem_datos: in tp_m_DAT; fichero: in string) is

variable datoLeido: st_bloque_dat;
variable etiqLeido: st_etiqueta;
variable estadoLeido: st_estado;

begin
	cabecera_memoria(fichero);

	for i in 0 to num_conjuntos-1 loop
		etiqLeido := mem_etiq(i);
		estadoLeido := mem_estado(i);
		datoLeido := mem_datos(i);
		imprimir(i, etiqLeido, estadoLeido, datoLeido, fichero);
	end loop;

end procedure impri_cache;

procedure impri_cache_L2(mem_etiq: in tp_m_ET_L2; mem_estado: in tp_m_EST_L2; mem_datos: in tp_m_DAT_L2; fichero: in string) is

variable datoLeido: st_bloque_dat;
variable etiqLeido: st_etiqueta_L2;
variable estadoLeido: st_estado_L2;

begin
	cabecera_memoria_L2(fichero);

	for i in 0 to num_conjuntos_L2-1 loop
		etiqLeido := mem_etiq(i);
		estadoLeido := mem_estado(i);
		datoLeido := mem_datos(i);
		imprimir_L2(i, etiqLeido, estadoLeido, datoLeido, fichero);
	end loop;

end procedure impri_cache_L2;

end package body impri_cache_pkg;

