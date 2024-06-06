library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_pkg is

type tipoestado is (DES0, DES, CMPET, INI, ESCINI, LEC, PBL, ESPL, LVIC, PEX, ESPE, ESB, ESC);

type tp_contro_e is record
	acc: std_logic;
   esc: std_logic;
	ini: std_logic;
end record;

type tp_contro_e_L2 is record 
   acc: std_logic;
	esc: std_logic;
	ini: std_logic;
	exp: std_logic;
end record;

type tp_contro_s is record
   listo : std_logic; -- pc_listo al productor
	finalizada: std_logic; -- rc_val al consumidor
end record;

type tp_contro_cam_estado is record
	AF: std_logic;
	EST: st_estado;
end record;

type tp_contro_cam_estado_L2 is record
	AF: std_logic;
	EST: st_estado_L2;
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
	 exp: std_logic; -- Señal de expulsion
end record;

type tp_contro_cam_cntl_L2 is record
    DAT_acc: std_logic;
    DAT_esc: std_logic;
    EST_acc: std_logic;
    EST_esc: std_logic;
    EST_DE: st_estado_L2;
    ET_acc: std_logic;
    ET_esc: std_logic;
	 muxB: std_logic; -- Dato de memoria o del productor
	 exp: std_logic; -- Señal de expulsion
end record;

type tp_cntl_L2_s is record 
    l2_acc: std_logic;
	 l2_pet: std_logic;
	 l2_esc: std_logic;
	 l2_exp: std_logic;
	 l2_ini: std_logic;
end record;

type tp_cntl_memoria_s is record
	 m_acc: std_logic;
	 m_pet: std_logic;
	 m_esc: std_logic;
end record;

type tp_cntl_memoria_e is record
	 m_val: std_logic;
end record;

end package controlador_pkg;