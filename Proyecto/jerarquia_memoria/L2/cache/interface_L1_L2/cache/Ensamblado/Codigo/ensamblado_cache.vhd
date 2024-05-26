library ieee;
use ieee.std_logic_1164.all; 

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.peticiones_cache_pkg.all;
use work.componentes_cache_pkg.all;
use work.componentes_multiplexor_pkg.all;

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

signal camino_e_inter: tp_camino_e;
signal camino_s_inter: tp_camino_s;

signal pet_controlador: tp_contro_e;
signal info_estado_controlador: tp_contro_cam_estado;
signal s_control_inter: tp_contro_cam_cntl;
signal resp_inter: tp_contro_s;

signal dirBloque: st_dir_bloque;

begin 

dirBloque <= peticion.dir(15 downto 1);

camino_datos_cache: camino_datos port map(reloj => reloj, camino_e => camino_e_inter, camino_s => camino_s_inter);

controlador_cache: controlador port map(reloj => reloj, pcero => pcero, pet_L1 => pet_controlador, info_estado => info_estado_controlador,
                                        resp_m => resp_m, s_control => s_control_inter, resp => resp_inter, pet_m => pet_m);

-- Multiplexor direccion procesador o direccion bloque expulsado --
mux_E: muxE port map(dir_bloque_proc => dirBloque, dir_bloque_exp => camino_s_inter.dir_EXP, sel => s_control_inter.exp, salida => dirB_expulsion);

-- entrada camino datos --
camino_e_inter <= (etiq_acc => s_control_inter.ET_acc,
                   dirB => peticion.dir(15 downto 1),
						 etiq_esc => s_control_inter.ET_esc,
						 est_acc => s_control_inter.EST_acc,
						 est_esc => s_control_inter.EST_esc,
						 est_DE => s_control_inter.EST_DE,
						 dat_acc => s_control_inter.DAT_acc,
						 dat_esc => s_control_inter.DAT_esc,
						 dat_mem => mbloque,
						 dat_L1 => peticion.dato_escribir,
						 muxB => s_control_inter.muxB);

-- entradas controlador --
pet_controlador <= (acc => peticion.acc,
                    esc => peticion.pe,
						  ini => peticion.ini,
						  exp => peticion.exp);

info_estado_controlador <= (AF => camino_s_inter.camp_AF,
                            EST => camino_s_inter.camp_EST);
				
-- Salidas --
respuesta.valido <= resp_inter.finalizada;

respuesta.dato_leido <= camino_s_inter.camp_DL;

bloque_leido <= camino_s_inter.camp_DL;
				  
listo <= resp_inter.listo;
 
end;