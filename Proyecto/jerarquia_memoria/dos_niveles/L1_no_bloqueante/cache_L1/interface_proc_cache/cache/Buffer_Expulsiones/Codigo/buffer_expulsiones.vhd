library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.componentes_bex_pkg.all;
use work.componentes_contador_bex_pkg.all;

entity buffer_expulsiones is 
   port(reloj: in std_logic;
	     pcero: in std_logic;
		  bex_control: in tp_cntl_bex;
		  dirExpulsion: in st_dir_bloque;
		  bloque_expulsar: in st_bloque_dat;
		  dirBloque: in st_dir_bloque;
		  dir_bex: out st_dir_bloque;
		  bloque_bex: out st_bloque_dat;
		  petExp_bex: out std_logic;
		  validez_bex: out std_logic;
		  bex_depen: out std_logic;
		  final_contador: out std_logic);
end entity;

architecture estructural of buffer_expulsiones is

signal pe_inter: std_logic;
signal val_PBL_inter: std_logic;
signal val_EXP_inter: std_logic;
signal pe_val_PBL_inter: std_logic;
signal pe_val_EXP_inter: std_logic;
signal pe_val_inter: std_logic;
signal validez_inter: std_logic;
signal validez_reg: std_logic;
signal dir_bex_inter: st_dir_bloque;
signal petExpulsion: std_logic;

begin

-- Comparador de dependencias en el buffer de expulsiones --
bex_depen <= '1' when (validez_reg = '1' and (dir_bex_inter = dirBloque)) else '0';

-- Interconexion
pe_inter <= bex_control.pe;
val_PBL_inter <= bex_control.val_PBL;
val_EXP_inter <= bex_control.val_EXP;
pe_val_PBL_inter <= bex_control.pe_val_PBL;
pe_val_EXP_inter <= bex_control.pe_val_EXP;
petExpulsion <= bex_control.tipo_exp;

-- Contador para forzar la expulsión del bloque almacenado --
cont_bex: contador_bex port map(reloj => reloj, pcero => pcero, bex_val => validez_reg, final => final_contador);

-- Registro para almacenar el tipo de expulsion que ha de emitirse (PtXl -> 0, PtX -> 1) --
dir_pet_exp: reg_petExpulsion port map(reloj => reloj, pe => pe_inter, entrada => petExpulsion, salida => petExp_bex);

-- Registro para almacenar la direccion de bloque a expulsar
dir_bloque_exp_reg: reg_dirBloque port map(reloj => reloj, pe => pe_inter, entrada => dirExpulsion, salida => dir_bex_inter);  

-- Registo para almacenar el bloque de memoria a expulsar
bloque_a_expulsar_reg: reg_bloqueExp port map(reloj => reloj, pe => pe_inter, entrada => bloque_expulsar, salida => bloque_bex);

-- Registro que almacena un bit de validez, para los datos guardados en el buffer
validez_bex_reg: reg_validezBex port map(reloj => reloj, pcero => pcero, pe_val => pe_val_inter, bit_validez => validez_inter, validez_bex => validez_reg);

-- Circuiteria asociada al bit de validez
circuiteria_validez_bex: multiplexores_reg_validez port map(val_PBL => val_PBL_inter, val_EXP => val_EXP_inter, pe_PBL => pe_val_PBL_inter, 
                                                            pe_EXP => pe_val_EXP_inter, validez => validez_inter, pe_val => pe_val_inter);
-- Salidas --		
dir_bex <= dir_bex_inter;							
validez_bex <= validez_reg;

																				
end estructural;
