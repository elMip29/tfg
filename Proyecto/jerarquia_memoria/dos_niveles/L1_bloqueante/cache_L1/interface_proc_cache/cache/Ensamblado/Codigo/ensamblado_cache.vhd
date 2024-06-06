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
		 L2_lista: in std_logic;
		 L2_bloque: in st_bloque_dat;
		 resp_L2: in std_logic;
		 pet_L2: out tp_cntl_L2_s;
		 respuesta: out tp_respuesta;
		 listo: out std_logic;
		 bloque_leido: out st_bloque_dat;
		 dirB_mem: out st_dir_bloque);
end entity;

architecture estructura of ensamblado_cache is 

signal camino_e_inter: tp_camino_e;
signal camino_s_inter: tp_camino_s;

signal pet_controlador: tp_contro_e;
signal info_estado_controlador: tp_contro_cam_estado;
signal s_control_inter: tp_contro_cam_cntl;
signal resp_inter: tp_contro_s;

signal dirBloque: st_dir_bloque;

signal byte_offset: std_logic;

signal dato_proc_replicado: st_bloque_dat;

begin 

byte_offset <= peticion.dir(0);

dirBloque <= peticion.dir(15 downto 1);

dato_proc_replicado <= peticion.dato_escribir(7 downto 0) & peticion.dato_escribir(7 downto 0);

camino_datos_cache: camino_datos port map(reloj => reloj, camino_e => camino_e_inter, camino_s => camino_s_inter);

controlador_cache: controlador port map(reloj => reloj, pcero => pcero, pet => pet_controlador, info_estado => info_estado_controlador,
                                        L2_lista => L2_lista, resp_L2 => resp_L2, s_control => s_control_inter, resp => resp_inter, pet_L2 => pet_L2);

-- Multiplexor direccion procesador o direccion bloque expulsado --
mux_E: muxE port map(dir_bloque_proc => dirBloque, dir_bloque_exp => camino_s_inter.dir_EXP, sel => s_control_inter.exp, salida => dirB_mem);

-- entrada camino datos --
camino_e_inter <= (etiq_acc => s_control_inter.ET_acc,
                   dirB => peticion.dir(15 downto 1),
						 etiq_esc => s_control_inter.ET_esc,
						 est_acc => s_control_inter.EST_acc,
						 est_esc => s_control_inter.EST_esc,
						 est_DE => s_control_inter.EST_DE,
						 dat_acc => s_control_inter.DAT_acc,
						 DAT_palabra_esc => s_control_inter.DAT_palabra_esc,
						 DAT_bloque_esc => s_control_inter.DAT_bloque_esc,
						 dat_L2 => L2_bloque,
						 dat_proc => dato_proc_replicado,
						 muxB => s_control_inter.muxB,
						 muxD => byte_offset);

-- entradas controlador --
pet_controlador <= (acc => peticion.acc,
                    esc => peticion.pe,
						  ini => peticion.ini);

info_estado_controlador <= (AF => camino_s_inter.camp_AF,
                            EST => camino_s_inter.camp_EST);
				
-- Salidas --
respuesta.valido <= resp_inter.finalizada;

respuesta.dato_leido <= camino_s_inter.palabra;
				  
listo <= resp_inter.listo;
 
bloque_leido <= camino_s_inter.camp_DL;

end;