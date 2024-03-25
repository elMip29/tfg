library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_pkg is

type tipoestado is (DES0, DES, CMPET, INI, ESCINI, LEC, PBL, ESPL, ESPE, ESB, ESC);

type tp_contro_e is record
	acc: std_logic;
   esc: std_logic;
	ini: std_logic;
end record;

type tp_contro_s is record
   listo : std_logic; -- pc_listo al productor
	finalizada: std_logic; -- rc_val al consumidor
end record;

type tp_contro_cam_estado is record
	AF: std_logic;
	EST: st_estado;
end record;

type tp_contro_cam_cntl is record
    DAT_acc: std_logic;
    DAT_palabra_esc: std_logic;
    DAT_bloque_esc: std_logic;
    EST_acc: std_logic;
    EST_esc: std_logic;
    EST_DE: st_estado;
    ET_acc: std_logic;
    ET_esc: std_logic;
	 muxB: std_logic; -- Dato de memoria o del productor
	 --exp: std_logic; -- Señal de expulsion
	 CMPET: std_logic; -- Señal de control de MuxE para selecionar @ que emite el procesador 
	 ESC_LEC: std_logic; -- Señal de control de MuxE para seleccionar @ de expulsion	 
end record;

type tp_cntl_memoria_s is record
	 m_acc: std_logic;
	 m_pet: std_logic;
	 m_esc: std_logic;
end record;

type tp_cntl_memoria_e is record
	 m_val: std_logic;
end record;

type tp_cntl_bex is record -- Mensaje de control para el buffer de expulsiones
    pe: std_logic;
	 val_PBL: std_logic;
	 val_ESC_LEC: std_logic;
	 pe_val_PBL: std_logic;
	 pe_val_ESC_LEC: std_logic;
end record;

end package controlador_pkg;