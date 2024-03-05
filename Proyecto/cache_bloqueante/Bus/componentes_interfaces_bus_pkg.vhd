library ieee;
use ieee.std_logic_1164.all;

use work.peticiones_cache_pkg.all;

package componentes_interfaces_bus_pkg is

component RegControl_pet is			
  port (reloj:in std_logic;
        pcero: in std_logic;	
        entrada: in tp_peticion_control;
        salida: out tp_peticion_control);
end component;

component RegControl_resp is						
  port (reloj: in std_logic;
        pcero: in std_logic;	
        entrada: in tp_respuesta_control;
        salida: out tp_respuesta_control);
end component;

component RegDatos_pet is	
  port (reloj: in std_logic;
        pcero: in std_logic;	
        entrada: in tp_peticion_datos;
        salida: out tp_peticion_datos);
end component;

component RegDatos_resp is		
  port (reloj: in std_logic;
        pcero: in std_logic;
        entrada: in tp_respuesta_datos;
        salida: out tp_respuesta_datos);
end component;

component interface_cache_bus_info is
	port(reloj, pcero	: in  std_logic;
		  mpet_info_e: in  tp_peticion_datos;
		  mresp_info_bus: in tp_respuesta_datos;
		  mpet_info_bus: out  tp_peticion_datos;
		  mresp_info_s: out tp_respuesta_datos);
end component;

component interface_cache_bus_control is
	port(reloj, pcero: in std_logic;
		  mpet_cntl_e: in tp_peticion_control;
		  mresp_cntl_bus: in tp_respuesta_control;
		  mpet_cntl_bus: out tp_peticion_control;
		  mresp_cntl_s: out tp_respuesta_control);
end component;

component interface_mem_bus_control is
  port (reloj: in std_logic;
	     pcero: in  std_logic;
        m_pet_cntl_bus: in tp_peticion_control;
	     m_resp_cntl_e: in tp_respuesta_control;
	     m_pet_cntl_s: out tp_peticion_control;
	     m_resp_cntl_bus: out tp_respuesta_control);
end component;

component interface_mem_bus_datos is
  port (reloj: in std_logic;
        pcero: in  std_logic;
        m_pet_datos_bus: in tp_peticion_datos;
	      m_resp_datos_e: in tp_respuesta_datos;
	      m_pet_datos_s: out tp_peticion_datos;
	      m_resp_datos_bus: out tp_respuesta_datos);
end component;

end package componentes_interfaces_bus_pkg;
