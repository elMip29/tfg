library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;

entity prueba_etiquetas is 

end entity;

architecture prueba of prueba_etiquetas is

component ensamblado_etiquetas is 
  port(reloj: in std_logic; 
	    etiq_entrada: in tp_etiq_e;
		 DL: out st_etiqueta;
		 AF: out std_logic);
end component;

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure escritura_etiqueta (signal reloj: in std_logic; direccion: st_dir; signal etiq_e: out tp_etiq_e) is 
begin 
    wait_until_falling_edges(reloj,1);
    etiq_e.acc <= '1';
	 etiq_e.dirB <= direccion(15 downto 1);
	 etiq_e.esc <= '1';
end procedure;

signal etiq_entrada: tp_etiq_e;
signal DL: st_etiqueta;
signal AF: std_logic;

signal reloj: std_logic;

shared variable final : boolean := false;

begin

etiquetas: ensamblado_etiquetas port map(reloj => reloj, etiq_entrada => etiq_entrada, DL => DL, AF => AF);

process
variable direccion: st_dir;

begin
   -- Escritura etiqueta contenedor 0 --
   direccion:= "0000000000010000";
   escritura_etiqueta(reloj, direccion, etiq_entrada);
	
	-- Comprobación Acierto etiqueta contenedor 0 --
	direccion:= "0000000000010001";
	escritura_etiqueta(reloj, direccion, etiq_entrada);
	
	-- Fallo en etiquetas, reemplazo etiqueta contenedor 0 --
	direccion:= "0000000000110000";
	escritura_etiqueta(reloj, direccion, etiq_entrada);
	
	--Escritura etiqueta contenedor 1 --
	direccion:= "1111111111100010";
	escritura_etiqueta(reloj, direccion, etiq_entrada);
	
	-- Acierto etiqueta contenedor 0 --
   direccion:= "0000000000110000";
	escritura_etiqueta(reloj, direccion, etiq_entrada);
	
	--Acierto etiqueta contenedor 1 --
	direccion:= "1111111111100010";
	escritura_etiqueta(reloj, direccion, etiq_entrada);

    assert false report "Comprobacion finalizada." severity note;
	 final := true;
    wait;
end process;

  
rlj:process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;
 
end prueba;
