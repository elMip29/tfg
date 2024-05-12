library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_pkg is

type tipoestado_acceso is (DES0, INI, ESCINI, DES, DES_ARB, CMPET, FALLO_SEC, ESP_CONT, CMPET_SEC, ABDF, LEC, ESC);

type tipoestado_fallo is (PBL, ESPL, ABC, ESB, LEC_F, ESC_F);

type tipoestado_expulsion is (DESEX, ESPE);

type tp_contro_e is record
	acc: std_logic;
   esc: std_logic;
	ini: std_logic;
	identificador: integer;
end record;

type tp_contro_s is record
   listo : std_logic; -- pc_listo al productor
	finalizada: std_logic; -- rc_val al consumidor
	identificador: integer;
end record;

type tp_contro_cam_estado is record
	AF: std_logic;
	EST: st_estado;
end record;

type tp_contro_ET is record
   ET_acc: std_logic;
	ET_esc: std_logic;
end record;

type tp_contro_EST is record 
   EST_acc: std_logic;
	EST_esc: std_logic;
	EST_esc_ocupado: std_logic;
	EST_DE: st_estado;
end record;

type tp_contro_DAT is record 
   DAT_acc: std_logic;
	DAT_palabra_esc: std_logic;
	DAT_bloque_esc: std_logic;
end record;

type tp_contro_cam_acceso is record 
   DAT_acc: std_logic;
   DAT_palabra_esc: std_logic;
   DAT_bloque_esc: std_logic;
   EST_acc: std_logic;
   EST_esc: std_logic;
	EST_esc_ocupado: std_logic;
   EST_DE: st_estado;
   ET_acc: std_logic;
   ET_esc: std_logic;
end record;

type tp_contro_cam_fallo is record 
   DAT_acc: std_logic;
   DAT_palabra_esc: std_logic;
   DAT_bloque_esc: std_logic;
   EST_acc: std_logic;
   EST_esc: std_logic;
	EST_esc_ocupado: std_logic;
   EST_DE: st_estado;
   ET_acc: std_logic;
   ET_esc: std_logic;
	FALLO: std_logic;
	muxB: std_logic;
end record;

type tp_contro_cam_cntl is record
    DAT_acc: std_logic;
    DAT_palabra_esc: std_logic;
    DAT_bloque_esc: std_logic;
    EST_acc: std_logic;
    EST_esc: std_logic;
	 EST_esc_ocupado: std_logic;
    EST_DE: st_estado;
    ET_acc: std_logic;
    ET_esc: std_logic;
	 FALLO: std_logic; -- Señal de control de MuxE para selecionar @ que emite el procesador 
	 EXP: std_logic; -- Señal de control de MuxE para seleccionar @ de expulsion
    muxB: std_logic;	 
end record;

type tp_cntl_memoria_s is record
	 m_acc: std_logic;
	 m_pet: std_logic;
	 m_esc: std_logic;
	 identificador: integer;
end record;

type tp_cntl_memoria_e is record
	 m_val: std_logic;
	 LE_mem: std_logic;
	 identificador: integer;
end record;

type tp_arb_pet is record 
    pet_arb: std_logic;
	 pet_arb_exp: std_logic; -- Señal para avisar al arbitro de que es necesario expulsar bloque
	 pet_bex_arb: std_logic;
end record;

type tp_arb_recursos_pet is record 
    pet_arb_acceso: std_logic;
	 pet_arb_fallo: std_logic;
end record;

type tp_arb_resp is record 
    conc_fallo_arb: std_logic;
	 conc_exp_arb: std_logic;
	 forzar_exp: std_logic;
end record;

type tp_arb_resp_recursos is record 
    conc_recursos_acceso: std_logic;
	 conc_recursos_fallo: std_logic;
end record;

type tp_cntl_bex is record -- Mensaje de control para el buffer de expulsiones
    pe: std_logic;
	 val_PBL: std_logic;
	 val_EXP: std_logic; -- Invalidar BEX
	 pe_val_PBL: std_logic;
	 pe_val_EXP: std_logic; -- Invalidar BEX
end record;

type tp_cntl_bdf is record -- Mensaje de control para el buffer de direcciones de fallo 
    pe_bdf: std_logic;
	 esc: std_logic; -- Escritura o Lectura 
	 validez_bdf: std_logic;
	 pe_val_bdf: std_logic;
end record;

type tp_cntl_bc is record -- Mensaje de control para el buffer de carga 
    validez_bc: std_logic;
	 pe_bc: std_logic;
	 pe_val_bc: std_logic;
end record;

end package controlador_pkg;