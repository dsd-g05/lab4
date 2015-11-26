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
-- Generated on "11/26/2015 1:22:49"
                                                            
-- Vhdl Test Bench template for design  :  g05_controller
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g05_mastermind_datapath_tst IS
END g05_mastermind_datapath_tst;
ARCHITECTURE g05_mastermind_datapath_arch OF g05_mastermind_datapath_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL EXT_PATTERN : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL GR_LD : STD_LOGIC;
SIGNAL GR_SEL : STD_LOGIC;
SIGNAL P_SEL : STD_LOGIC;
SIGNAL SC_CMP : STD_LOGIC;
SIGNAL SR_LD : STD_LOGIC;
SIGNAL SR_SEL : STD_LOGIC;
SIGNAL TC_EN : STD_LOGIC;
SIGNAL TC_LAST : STD_LOGIC;
SIGNAL TC_RST : STD_LOGIC;
SIGNAL TM_EN : STD_LOGIC;
SIGNAL TM_IN : STD_LOGIC;
COMPONENT g05_mastermind_datapath
	PORT (
	CLK : IN STD_LOGIC;
    EXT_PATTERN : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	GR_LD : IN STD_LOGIC;
	GR_SEL : IN STD_LOGIC;
	P_SEL : IN STD_LOGIC;
	SC_CMP : OUT STD_LOGIC;
	SR_LD : IN STD_LOGIC;
	SR_SEL : IN STD_LOGIC;
	TC_EN : IN STD_LOGIC;
	TC_LAST : OUT STD_LOGIC;
	TC_RST : IN STD_LOGIC;
	TM_EN : IN STD_LOGIC;
	TM_IN : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g05_mastermind_datapath
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
    EXT_PATTERN => EXT_PATTERN,
	GR_LD => GR_LD,
	GR_SEL => GR_SEL,
	P_SEL => P_SEL,
	SC_CMP => SC_CMP,
	SR_LD => SR_LD,
	SR_SEL => SR_SEL,
	TC_EN => TC_EN,
	TC_LAST => TC_LAST,
	TC_RST => TC_RST,
	TM_EN => TM_EN,
	TM_IN => TM_IN
	);                                         
always : PROCESS                                              
                                   
BEGIN                                                         
    --setup possibility table
    TM_IN <= '0';
    TM_EN <= '0';
    TC_RST <= '1';
    TC_EN <='0';

    --set selectors to zero
    P_SEL <= '0';
    GR_SEL <= '0';
    SR_SEL <= '0';

    --set load to false
    GR_LD <= '0';
    SR_LD <= '0';

    --set external pattern to '4321'
    EXT_PATTERN <= "100011010001";

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --run possibility table
    TC_RST <= '0';
    TC_EN <= '1';

    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --load TM_ADDR into guess register
    GR_LD <= '1';

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --load "0011" into guess register
    GR_SEL <= '1';

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --load score of "4321" and "0011" into score register
    SR_LD <= '1';

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --load score of TM_ADDR and "0011" into score register
    P_SEL <= '1';
    GR_SEL <= '0';
    SR_LD <= '1';

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;

    --compare score with (4,0), scorecode "0000"
    SR_SEL <= '1';

    --run clock
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
    
WAIT;                                                        
END PROCESS always;                                          
END g05_mastermind_datapath_arch;
