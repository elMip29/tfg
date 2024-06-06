library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity multiplexores_reg_validez is 
   port(val_PBL: in std_logic; 
	     val_ESC_LEC: in std_logic;
		  pe_PBL: in std_logic;
		  pe_ESC_LEC: in std_logic;
		  validez: out std_logic;
		  pe_val: out std_logic);
end entity;


architecture comportamiento of multiplexores_reg_validez is 

begin

  pe_val <= (pe_PBL or pe_ESC_LEC);
  
  validez <= (val_PBL and pe_PBL) or (not(val_ESC_LEC and pe_ESC_LEC));
  
end comportamiento;