library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

package componentes_jerarquia_pkg is

component interface_L1_con_L2 is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
        pet_proc: in tp_peticion;
	     resp_L2: in tp_respuesta_L2;
		  L2_lista: in std_logic;
		  val_BC: in std_logic;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta;
		  pet_L2: out tp_peticion_L2);
end component;

component memoria_con_interface_bus is
   port(reloj: in std_logic;
	     pcero: in std_logic;
		  m_pet_datos_bus: in tp_peticion_datos;
		  m_pet_cntrl_bus: in tp_peticion_control;
		  m_resp_datos_bus: out tp_respuesta_datos;
		  m_resp_cntrl_bus: out tp_respuesta_control);
end component;

component interface_cache_con_bus is 										
	port(reloj: in std_logic; 
	     pcero: in std_logic;
		  pet_L1: in tp_peticion_L2;
		  mresp_cntl_bus: in tp_respuesta_control;
		  mresp_datos_bus: in tp_respuesta_datos;
		  pet_listo: out std_logic;
		  resp_cache: out tp_respuesta_L2;
		  val_BC: out std_logic;
		  s_error: out std_logic;
		  mpet_cntl_bus: out tp_peticion_control;
		  mpet_datos_bus: out tp_peticion_datos);
end component;

end package componentes_jerarquia_pkg;