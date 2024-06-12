library ieee;
use ieee.std_logic_1164.all;

entity sync_validez_bc is
  port(reloj: in std_logic;
       val_BC: in std_logic;
		 val_BC_s: out std_logic);
end entity;

architecture estructural of sync_validez_bc is

component reg_sync is 
  port(reloj: in std_logic;
       entrada: in std_logic;
		 salida: out std_logic);
end component;

signal val_BC_s_reg: std_logic;

begin

val_BC_s <= val_BC_s_reg;

registro_asociado: reg_sync port map(reloj => reloj, entrada => val_BC, salida => val_BC_s_reg);

end estructural;