-- Descp. Controller of the Datapath/Controller architecture for solving Mastermind
--
-- entity name: g05_mastermind_controller
--
-- Version 1.0
-- Author: Felix Dube; felix.dube@mail.mcgill.ca & Auguste Lalande; auguste.lalande@mail.mcgill.ca
-- Date: November 23, 2015

library ieee;
use ieee.std_logic_1164.all;

entity g05_mastermind_controller is
	port (
        SC_CMP, TC_LAST : in std_logic;
        START, READY : in std_logic;
        CLK : in std_logic;
        SR_SEL, P_SEL, GR_SEL : out std_logic; 
        GR_LD, SR_LD : out std_logic;
        TM_IN, TM_EN, TC_EN, TC_RST : out std_logic; 
        SOLVED : out std_logic
	);
end g05_mastermind_controller;

architecture behavior of g05_mastermind_controller is
    type state is (s1, s2, s3, s4, s5, s6, s7, s8, s9);
    signal s_present, s_next : state;
begin
    process(SC_CMP, TC_LAST, START, READY)
    begin
        case s_present is
            when s1 =>
                if START = '1' then
                    s_next <= s1;
                else
                    s_next <= s2;
                end if;
                
            when s2 =>
                if START = '0' then
                    s_next <= s2;
                else
                    s_next <= s3;
                end if;
                
            when s3 =>
                if TC_LAST = '0' then
                    s_next <= s3;
                else
                    s_next <= s4;
                end if;
                
            when s4 =>
                if READY = '0' then
                    s_next <= s4;
                else
                    s_next <= s5;
                end if;
                
            when s5 =>
                if SC_CMP = '0' then
                    s_next <= s6;
                else
                    s_next <= s9;
                end if;
                
            when s6 =>
                if SC_CMP = '0' then
                    s_next <= s6;
                else
                    s_next <= s7;
                end if;
                
            when s7 =>
                if TC_LAST = '0' then
                    s_next <= s7;
                else
                    s_next <= s8;
                end if;
                
            when s8 =>
                if READY = '0' then
                    s_next <= s8;
                else
                    s_next <= s5;
                end if;
                
            when s9 =>
                if START = '1' then
                    s_next <= s9;
                else
                    s_next <= s2;
                end if;
        end case;
    end process;
 
    
	process(CLK)
	begin
		if START = '0' then
			s_present <= s2;
		elsif rising_edge(CLK) then
			s_present <= s_next;
		end if;
	end process;
    
    
    

    SR_SEL <= '1' when s_present = s5 else '0';
    P_SEL <= '1' when s_present = s6 or s_present = s7 else '0';
    GR_SEL <= '1' when s_present = s4 else '0';
    GR_LD <= '1' when s_present = s4 or s_present = s6 else '0';
    SR_LD <= '1' when s_present = s5 else '0';
    TM_IN <= '1' when s_present = s3 else
                SC_CMP when s_present = s6 or s_present = s7 else '0';
    TM_EN <= '1' when s_present = s3 or s_present = s6 or s_present = s7 else '0';
    TC_EN <= '1' when s_present = s3 or s_present = s6 or s_present = s7 else '0';
    TC_RST <= '1' when s_present = s1 or s_present = s4 or s_present = s8 or s_present = s9 else '0';
    SOLVED <= '1' when s_present = s9 else '0';

end behavior;