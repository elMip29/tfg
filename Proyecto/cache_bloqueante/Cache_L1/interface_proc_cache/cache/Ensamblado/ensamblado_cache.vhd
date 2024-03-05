library ieee;
use ieee.std_logic_1164.all; 

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;

entity ensamblado_cache is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 peticion: in tp_peticion;
		 resp_m: in tp_cntl_memoria_e;
		 mbloque: in st_bloque_dat;
		 pet_m: out tp_cntl_memoria_s;
		 respuesta: out tp_respuesta;
		 listo: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_expulsion: out st_dir_bloque);
end entity;

architecture estructura of ensamblado_cache is 

component camino_datos is 
  port(reloj: in std_logic;
       camino_e: in tp_camino_e;
		 camino_s: out tp_camino_s);
end component;

component controlador is 
  port(reloj: in std_logic;
       pcero: in std_logic;
		 pet: in tp_contro_e;
		 info_estado: in tp_contro_cam_estado;
		 resp_m: in tp_cntl_memoria_e;
		 s_control: out tp_contro_cam_cntl;
		 resp: out tp_contro_s;
		 pet_m: out tp_cntl_memoria_s);
end component;

signal camino_e_inter: tp_camino_e;
signal camino_s_inter: tp_camino_s;

signal pet_controlador: tp_contro_e;
signal info_estado_controlador: tp_contro_cam_estado;
signal s_control_inter: tp_contro_cam_cntl;
signal resp_inter: tp_contro_s;

signal dirBloque: st_dir_bloque;
signal byte_offset: std_logic;
signal palabra_leida: st_palabra_dat;

signal esc_pala_0: std_logic;
signal esc_pala_1: std_logic;
signal permiso_escritura: st_bloque_esc;

signal dato_a_escribir: st_bloque_dat;

begin 

byte_offset <= peticion.dir(0);

camino_datos_cache: camino_datos port map(reloj => reloj, camino_e => camino_e_inter, camino_s => camino_s_inter);

controlador_cache: controlador port map(reloj => reloj, pcero => pcero, pet => pet_controlador, info_estado => info_estado_controlador,
                                        resp_m => resp_m, s_control => s_control_inter, resp => resp_inter, pet_m => pet_m);

-- entrada camino datos --
camino_e_inter <= (etiq_acc => s_control_inter.ET_acc,
                   dirB => peticion.dir(15 downto 1),
						 etiq_esc => s_control_inter.ET_esc,
						 est_acc => s_control_inter.EST_acc,
						 est_esc => s_control_inter.EST_esc,
						 est_DE => s_control_inter.EST_DE,
						 dat_acc => s_control_inter.DAT_acc,
						 dat_esc => permiso_escritura,
						 dat_DE => dato_a_escribir);


-- entradas controlador --
pet_controlador <= (acc => peticion.acc,
                    esc => peticion.pe,
						  ini => peticion.ini);

info_estado_controlador <= (AF => camino_s_inter.camp_AF,
                            EST => camino_s_inter.camp_EST);
									 
-- Multiplexor Bloque memoria o dato procesador --
with s_control_inter.muxE select 
 dato_a_escribir <= mbloque when '1',
                    peticion.dato_escribir(7 downto 0) & peticion.dato_escribir(7 downto 0) when others; -- Replicamos el dato que viene del procesador
									 
-- Circuiteria para los permisos de escritura en el campo datos --
esc_pala_0 <= (not byte_offset and s_control_inter.DAT_palabra_esc) or s_control_inter.DAT_bloque_esc;
esc_pala_1 <= (byte_offset and s_control_inter.DAT_palabra_esc) or s_control_inter.DAT_bloque_esc;

permiso_escritura(0) <= esc_pala_0;
permiso_escritura(1) <= esc_pala_1;

-- Multiplexor direccion procesador o direccion bloque expulsado --
with s_control_inter.exp select 
 dirB_expulsion <= peticion.dir(15 downto 1) when '0',
                   camino_s_inter.camp_ET & peticion.dir(bitMAS_cj - 1 downto bitMEN_cj) when '1';

-- Multiplexor bloque leido campo datos --
with byte_offset select 
 respuesta.dato_leido <= camino_s_inter.camp_DL(7 downto 0) when '0',
                  camino_s_inter.camp_DL(15 downto 8) when '1';
						
-- Salidas --
respuesta.valido <= resp_inter.finalizada;
				  
listo <= resp_inter.listo;
 
bloque_leido <= camino_s_inter.camp_DL;

end;