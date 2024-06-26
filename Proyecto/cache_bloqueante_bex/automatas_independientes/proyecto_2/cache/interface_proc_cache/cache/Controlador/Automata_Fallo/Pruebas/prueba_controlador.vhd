library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;

entity prueba_controlador is 

end;

architecture prueba of prueba_controlador is 

component auto_fallo is 
    port(reloj: in std_logic;
         pcero: in std_logic;
		   pet: in tp_contro_e;
		   info_estado: in tp_contro_cam_estado;
		   mem_lista: in std_logic;
			conc_arb: in tp_arb_resp;
		   s_control: out tp_contro_cam_cntl;
			pet_arb: out tp_arb_pet;
			bex_control: out tp_cntl_bex;
		   resp: out tp_contro_s;
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
signal pet: tp_contro_e;
signal info_estado: tp_contro_cam_estado;
signal resp_m: tp_cntl_memoria_e;
signal bex_control: tp_cntl_bex;
signal s_control: tp_contro_cam_cntl;
signal resp: tp_contro_s;
signal pet_m: tp_cntl_memoria_s;
signal conc_arb: tp_arb_resp;
signal pet_arb: tp_arb_pet;
signal mem_lista: std_logic;

constant retardo: time:= 2 ns;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';


procedure inicio(signal reloj: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '1' after retardo;
	pet.esc <= '0' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "00" after retardo;
	
end procedure;

procedure no_peticion(signal reloj: std_logic; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj);
	
	pet.acc <= '0' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '0' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "00" after retardo;
	
end procedure;

procedure escritura_acierto(signal reloj: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '1' after retardo;
	
	info_estado.AF <= '1' after retardo;
	info_estado.EST <= "11" after retardo;
	
end procedure;

procedure lectura_acierto(signal reloj: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '0' after retardo;
	
	info_estado.AF <= '1' after retardo;
	info_estado.EST <= "01" after retardo;
	
end procedure;

procedure lectura_fallo(signal reloj: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '0' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "00" after retardo;
	
end procedure;

procedure escritura_fallo(signal reloj: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '1' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "00" after retardo;
	
end procedure;

procedure lectura_expulsion(signal relok: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is 
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '0' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "11" after retardo;

end procedure;

procedure escritura_expulsion(signal relok: in std_logic; signal resp: in tp_contro_s; signal pet: out tp_contro_e; signal info_estado: out tp_contro_cam_estado) is 
begin 
   wait until falling_edge(reloj) and resp.listo = SI;
	
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
	pet.esc <= '1' after retardo;
	
	info_estado.AF <= '0' after retardo;
	info_estado.EST <= "11" after retardo;

end procedure;

shared variable final : boolean:= false;
signal ciclo: integer:= 0;
signal reg_pet: tp_contro_e;
signal reg_s_estado: tp_contro_cam_estado;
begin

--regi_pet: registro_pet port map(reloj => reloj, pe => resp.listo, e => pet, s => reg_pet);

--reg_est: registro_est port map(reloj => reloj, pe => resp.listo, e => info_estado, s => reg_s_estado);

contro: auto_fallo port map(reloj => reloj, pcero => pcero, pet => pet, info_estado => info_estado, mem_lista => mem_lista, conc_arb => conc_arb, s_control => s_control, pet_arb => pet_arb, bex_control => bex_control, resp => resp, pet_m => pet_m);

estimulos: process 
begin 

    -- Inicializaciones --
    pcero <= SI;
	 pet.acc <= '0' after retardo;
	 pet.ini <= '0' after retardo;
	 pet.esc <= '0' after retardo;
	 conc_arb.conc_fallo_arb <= '0' after retardo;
	 mem_lista <= '1' after retardo;
	 
	 info_estado.AF <= '0' after retardo;
	 info_estado.EST <= "00" after retardo;
	 wait until rising_edge(reloj);
	 pcero <= NO after retardo;
	 wait until rising_edge(reloj);
	
	 -- Casos --
    inicio(reloj, resp, pet, info_estado);	
	 
	 no_peticion(reloj, pet, info_estado);
	 
	 lectura_acierto(reloj, resp, pet, info_estado);
	 
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	 
	 escritura_acierto(reloj, resp, pet, info_estado);
	 
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	 
	 lectura_fallo(reloj, resp, pet, info_estado);
	 
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 conc_arb.conc_fallo_arb <= '1';
	 mem_lista <= '0';

	 wait until rising_edge(reloj);
	 mem_lista <= '1';
	 conc_arb.conc_fallo_arb <= '0';
	 
	 wait until rising_edge(reloj);
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	 
	 escritura_fallo(reloj, resp, pet, info_estado);
    
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 conc_arb.conc_fallo_arb <= '1';
	 mem_lista <= '0';

	 wait until rising_edge(reloj);
	 mem_lista <= '1';
	 conc_arb.conc_fallo_arb <= '0';
	 
	 wait until rising_edge(reloj);
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	 
	 lectura_expulsion(reloj, resp, pet, info_estado);
	 
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 conc_arb.conc_fallo_arb <= '1';
	 mem_lista <= '0';
	 
	 wait until rising_edge(reloj);
	 mem_lista <= '1';
	 conc_arb.conc_fallo_arb <= '0';
	 
	 wait until rising_edge(reloj);
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	  
	 escritura_expulsion(reloj, resp, pet, info_estado); 

	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 conc_arb.conc_fallo_arb <= '1';
	 mem_lista <= '0';
	 
	 wait until rising_edge(reloj);
	 mem_lista <= '1';
	 conc_arb.conc_fallo_arb <= '0';
	 
	 wait until rising_edge(reloj);
	 wait until falling_edge(reloj);
	 wait until falling_edge(reloj);
	 no_peticion(reloj, pet, info_estado);
	 
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj);
	 wait until rising_edge(reloj) and resp.listo = SI;
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
	 