library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.componentes_bdf_pkg.all;

entity buffer_DF is 
  port(reloj: in std_logic; 
	    pcero: in std_logic;
		 dir_fallo: in st_dir;
		 dato_esc: in st_palabra_dat;
		 bdf_control: in tp_cntl_bdf;
		 identificador: in integer;
		 identificador_reg: out integer;
		 dir_fallo_reg: out st_dir;
		 dato_esc_reg: out st_palabra_dat;
		 LE_reg: out std_logic; -- bit para ver si es lectura o escritura
		 val_bdf: out std_logic; 
		 fallo_secundario: out std_logic);
end entity;

architecture estructural of buffer_DF is
 
signal LE: std_logic;
signal pe_inter: std_logic;
signal val_bdf_inter: std_logic;
signal pe_val_bdf_inter: std_logic;
signal val_bdf_salida: std_logic;
signal dir_fallo_reg_inter: st_dir;

begin 

-- Interconexion --
LE <= bdf_control.esc;
pe_inter <= bdf_control.pe_bdf;
val_bdf_inter <= bdf_control.validez_bdf;
pe_val_bdf_inter <= bdf_control.pe_val_bdf;

-- Comparador para detectar los casos de "Fallos secundarios" --
fallo_secundario <= '1' when (val_bdf_salida = '1' and (dir_fallo(15 downto 1) = dir_fallo_reg_inter(15 downto 1))) else '0';

-- Registro para almacenar el identificador de la peticion -
iden_reg: reg_identificador port map(reloj => reloj, entrada => identificador, pe => pe_inter, salida => identificador_reg);

-- Registro para almacenar si el acceso que ha sido fallo es una lectura o una escritura --
LEC_ESC_reg: reg_LE port map(reloj => reloj, entrada => LE, pe => pe_inter, salida => LE_reg);

-- Registro para almacenar la direccion del fallo --
dirFallo_reg: reg_dirFallo port map(reloj => reloj, entrada => dir_fallo, pe => pe_inter, salida => dir_fallo_reg_inter);

-- Registro para almacenar el dato a escribir en memoria --
dato_reg: reg_dato_esc port map(reloj => reloj, entrada => dato_esc, pe => pe_inter, salida => dato_esc_reg);

-- Registro para almacenar el bit de validez del BDF --
val_bdf_reg: reg_validez_bdf port map(reloj => reloj, pcero => pcero, entrada => val_bdf_inter, pe_val => pe_val_bdf_inter, salida => val_bdf_salida); 

-- Salidas --
val_bdf <= val_bdf_salida;
dir_fallo_reg <= dir_fallo_reg_inter;

end estructural;