library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.componentes_bc_pkg.all;

entity buffer_carga is 
  port(reloj: in std_logic; 
       pcero: in std_logic;
		 bloque_mem: in st_bloque_dat;
		 acceso_lec: in std_logic; -- Senyal para validar el buffer de carga
		 bc_cntl: in tp_cntl_bc;
		 bloque_mem_reg: out st_bloque_dat;
       validez_BC: out std_logic);
end entity;

architecture estructural of buffer_carga is 

signal val_bc_inter, pe_val_bc_inter: std_logic;

begin 

-- Interconexion --
val_bc_inter <= acceso_lec or bc_cntl.validez_bc; -- Por defecto Buffer carga invalido. Solo se valida cuando peticion de lectura de bloque
pe_val_bc_inter <= bc_cntl.pe_val_bc;

-- Registro donde se almacena el bloque que proviene de memoria --
bloque_reg: reg_bloq_mem port map(reloj => reloj, entrada => bloque_mem, salida => bloque_mem_reg);

-- Registro para almacenar el bit de validez del buffer de carga --
val_bc_reg: reg_val_BC port map(reloj => reloj, pcero => pcero, entrada => val_bc_inter, pe_val => pe_val_bc_inter, salida => validez_BC);

end estructural;