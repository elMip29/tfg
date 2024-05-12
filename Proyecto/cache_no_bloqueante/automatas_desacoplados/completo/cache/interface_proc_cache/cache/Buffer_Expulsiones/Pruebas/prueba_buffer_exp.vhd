library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

entity prueba_buffer_exp is 

end;

architecture prueba of prueba_buffer_exp is 

component buffer_expulsiones is 
     port(reloj: in std_logic;
	       pcero: in std_logic;
		    bex_control: in tp_cntl_bex;
		    dirExpulsion: in st_dir_bloque;
		    bloque_expulsar: in st_bloque_dat;
		    dir_bex: out st_dir_bloque;
		    bloque_bex: out st_bloque_dat;
		    validez_bex: out std_logic);
end component;

signal reloj: std_logic;
signal pcero: std_logic;
signal bex_control: tp_cntl_bex;
signal dirExpulsion: st_dir_bloque;
signal bloque_expulsar: st_bloque_dat;
signal dir_bex: st_dir_bloque;
signal bloque_bex: st_bloque_dat;
signal validez_bex: std_logic;

constant retardo: time:= 2 ns;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure validar_buffer_exp(signal reloj: in std_logic; direccion: st_dir_bloque; dato: st_bloque_dat; signal bex_control: out tp_cntl_bex; signal dirExpulsion: out st_dir_bloque; signal bloque_expulsar: out st_bloque_dat) is
begin
  wait_until_falling_edges(reloj,1);
  bex_control.pe <= '1';
  bex_control.val_PBL <= '1';
  bex_control.pe_val_PBL <= '1';
  dirExpulsion <= direccion;
  bloque_expulsar <= dato; 
  bex_control.val_ESC_LEC <= '0';
  bex_control.pe_val_ESC_LEC <= '0';
end procedure;

procedure invalidar_buffer_exp(signal reloj: in std_logic; signal bex_control: out tp_cntl_bex) is
begin
  wait_until_falling_edges(reloj,1);
  bex_control.val_ESC_LEC <= '1';
  bex_control.pe_val_ESC_LEC <= '1';
  bex_control.pe <= '0';
  bex_control.val_PBL <= '0';
  bex_control.pe_val_PBL <= '0';
end procedure;

shared variable final : boolean:= false;
signal ciclo: integer:= 0;

begin

buffer_exp: buffer_expulsiones port map(reloj => reloj, pcero => pcero, bex_control => bex_control, dirExpulsion => dirExpulsion, bloque_expulsar => bloque_expulsar, dir_bex => dir_bex, bloque_bex => bloque_bex, validez_bex => validez_bex);

estimulos: process 
variable direccion: st_dir_bloque;
variable dato: st_bloque_dat;
begin 

    -- Inicializaciones --
    pcero <= SI;
	 wait until rising_edge(reloj);
	 pcero <= NO after retardo;
	 wait until rising_edge(reloj);
	
	 -- Casos --
	 direccion:= "000000000000001";
	 dato:= "0000000000000001";
    validar_buffer_exp(reloj, direccion, dato, bex_control, dirExpulsion, bloque_expulsar);	
	 
	 invalidar_buffer_exp(reloj, bex_control);
	 
	 direccion:= "000001000001000";
	 dato:= "0001011100100001";
	 validar_buffer_exp(reloj, direccion, dato, bex_control, dirExpulsion, bloque_expulsar);
	 
	 invalidar_buffer_exp(reloj, bex_control);
    
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 report "Fin";
	 
	 final := true;
	 wait;
end process;

rlj: process 
begin 

   if final = false then 
	   reloj <= '0';
		wait for 40 ns;
		ciclo <= ciclo + 1;
		reloj <= '1';
		wait for 40 ns;
		else 
		   wait;
		end if;
end process;

end;