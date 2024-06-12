library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

entity prueba_controlador is 

end;

architecture prueba of prueba_controlador is 

component auto_exp is 
    port(reloj: in std_logic;
         pcero: in std_logic;
		   bex_val: in std_logic;
		   concesion_arb: in tp_arb_resp;
		   mem_lista: in std_logic;
		   pet_arb_bex: out tp_arb_pet;
		   s_control: out tp_contro_cam_cntl;
		   bex_control: out tp_cntl_bex;
		   pet_m: out tp_cntl_memoria_s);
end component;

component registro_pet is
    port(reloj: in std_logic;
	      pe: in std_logic;
			e: in tp_contro_e;
			s: out tp_contro_e);
end component;

component registro_est is
    port(reloj: in std_logic;
	      pe: in std_logic;
			e: in tp_contro_cam_estado;
			s: out tp_contro_cam_estado);
end component;


signal reloj: std_logic;
signal pcero: std_logic;
signal bex_val: std_logic;
signal concesion_arb: tp_arb_resp;
signal mem_lista: std_logic;
signal pet_arb_bex: tp_arb_pet;
signal bex_control: tp_cntl_bex;
signal s_control: tp_contro_cam_cntl;
signal pet_m: tp_cntl_memoria_s;

constant retardo: time:= 2 ns;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

shared variable final : boolean:= false;
signal ciclo: integer:= 0;
signal reg_pet: tp_contro_e;
signal reg_s_estado: tp_contro_cam_estado;
begin

--regi_pet: registro_pet port map(reloj => reloj, pe => resp.listo, e => pet, s => reg_pet);

--reg_est: registro_est port map(reloj => reloj, pe => resp.listo, e => info_estado, s => reg_s_estado);

contro: auto_exp port map(reloj => reloj, pcero => pcero, bex_val => bex_val, concesion_arb => concesion_arb, mem_lista => mem_lista, pet_arb_bex => pet_arb_bex, s_control => s_control, bex_control => bex_control, pet_m => pet_m);

estimulos: process 
begin 

    -- Inicializaciones --
    pcero <= SI;
	 mem_lista <= '1';
	 concesion_arb.conc_exp_arb <= '0';
	 bex_val <= '0';
	
	 wait until rising_edge(reloj);
	 pcero <= NO after retardo;
	 wait until rising_edge(reloj);
	
	 -- Casos --
    
	 bex_val <= '1';
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 concesion_arb.conc_exp_arb <= '1';
	 mem_lista <= '0';
	 
	 wait until falling_edge(reloj);
	 concesion_arb.conc_exp_arb <= '0';
	 mem_lista <= '1';
	 bex_val <= '0';
	 
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 concesion_arb.conc_exp_arb <= '1';
	 mem_lista <= '0';
	 
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 concesion_arb.conc_exp_arb <= '0';
	 mem_lista <= '1';
	 wait until falling_edge(reloj);
	 bex_val <= '1';
	 
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
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
	 