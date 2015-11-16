-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "11/16/2015 15:46:38"
                                                            
-- Vhdl Test Bench template for design  :  g05_prime_counter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g05_prime_counter_vhd_tst IS
END g05_prime_counter_vhd_tst;
ARCHITECTURE g05_prime_counter_arch OF g05_prime_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL mode : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL p_number : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT g05_prime_counter
	PORT (
	clk : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	p_number : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g05_prime_counter
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	enable => enable,
	mode => mode,
	p_number => p_number,
	reset => reset
	);                                                                                              
always : PROCESS                                                                            
BEGIN                                                         
	--Set up																			
	clk <= '0';
	enable <= '0';
	mode <= "11";
	reset <= '1';
	wait for 10 ns;
	reset <= '0';
	wait for 10 ns;
	mode <= "00";
	
	--Go through the prime number sequence
	reset <= '1';
	enable <= '1';
	
	FOR i IN 0 TO 25 LOOP
		clk <= '1';
      wait for 10 ns;
		clk <= '0';
      wait for 10 ns;
	END LOOP;

	--Go through the Sophie Germain prime number sequence
	mode <= "01";
	reset <= '0';
	wait for 10 ns;
	
	reset <= '1';
	
	FOR i IN 0 TO 10 LOOP
		clk <= '1';
      wait for 10 ns;
		clk <= '0';
      wait for 10 ns;
	END LOOP;
	
	--Go through the mersenne prime number sequence
	mode <= "10";
	reset <= '0';
	wait for 10 ns;
	
	reset <= '1';
	
	FOR i IN 0 TO 3 LOOP
		clk <= '1';
      wait for 10 ns;
		clk <= '0';
      wait for 10 ns;
	END LOOP;
WAIT;                                                        
END PROCESS always;                                          
END g05_prime_counter_arch;
