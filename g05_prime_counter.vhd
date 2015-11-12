-- Descp. counts prime numbers
--
-- entity name: g05_prime_counter
--
-- Version 1.0
-- Author: Felix Dube; felix.dube@mail.mcgill.ca & Auguste Lalande; auguste.lalande@mail.mcgill.ca
-- Date: November 12 2015

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all

entity g05_prime_counter is
	port (
		mode : in std_logic_vector(1 downto 0);
		enable : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		p_number : out std_logic_vector(7 downto 0)
	);
end g05_prime_counter;

architecture behavior of g05_prime_counter is

	type primes is(p0, p2, p3, p5, p7, p11, p13, p17, p19, p23,
			   p29, p31, p37, p41, p43, p47, p53, p59, p61,
			   p67, p71, p73, p79, p83, p89, p97);
signal p_present, p_next : primes;
begin
	process(mode, p_present)
	begin
		if enable = '1' then
			case p_present is
				when p0 =>
					if mode = "00" then
						p_next <= p2;
					elsif mode = "01" then
						p_next <= p2;
					else
						p_next <= p3;
					end if;
				when p2 =>
					if mode = "00" then
						p_next <= p3;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p3 =>
					if mode = "00" then
						p_next <= p5;
					elsif mode = "01" then
						p_next <= p5;
					else
						p_next <= p7;
					end if;
				when p5 =>
					if mode = "00" then
						p_next <= p7;
					elsif mode = "01" then
						p_next <= p11;
					else
						p_next <= p3;
					end if;
				when p7 =>
					if mode = "00" then
						p_next <= p11;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p31;
					end if;
				when p11 =>
					if mode = "00" then
						p_next <= p13;
					elsif mode = "01" then
						p_next <= p23;
					else
						p_next <= p3;
					end if;
				when p13 =>
					if mode = "00" then
						p_next <= p17;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p17 =>
					if mode = "00" then
						p_next <= p19;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p19 =>
					if mode = "00" then
						p_next <= p23;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p23 =>
					if mode = "00" then
						p_next <= p29;
					elsif mode = "01" then
						p_next <= p29;
					else
						p_next <= p3;
					end if;
				when p29 =>
					if mode = "00" then
						p_next <= p31;
					elsif mode = "01" then
						p_next <= p41;
					else
						p_next <= p3;
					end if;
				when p31 =>
					if mode = "00" then
						p_next <= p37;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p0;
					end if;
				when p37 =>
					if mode = "00" then
						p_next <= p41;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p41 =>
					if mode = "00" then
						p_next <= p43;
					elsif mode = "01" then
						p_next <= p53;
					else
						p_next <= p3;
					end if;
				when p43 =>
					if mode = "00" then
						p_next <= p47;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p47 =>
					if mode = "00" then
						p_next <= p53;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p53 =>
					if mode = "00" then
						p_next <= p59;
					elsif mode = "01" then
						p_next <= p83;
					else
						p_next <= p3;
					end if;
				when p59 =>
					if mode = "00" then
						p_next <= p61;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p61 =>
					if mode = "00" then
						p_next <= p67;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p67 =>
					if mode = "00" then
						p_next <= p71;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p71 =>
					if mode = "00" then
						p_next <= p73;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p73 =>
					if mode = "00" then
						p_next <= p79;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p79 =>
					if mode = "00" then
						p_next <= p83;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when p83 =>
					if mode = "00" then
						p_next <= p89;
					elsif mode = "01" then
						p_next <= p89;
					else
						p_next <= p3;
					end if;
				when p89 =>
					if mode = "00" then
						p_next <= p97;
					elsif mode = "01" then
						p_next <= p0;
					else
						p_next <= p3;
					end if;
				when p97 =>
					if mode = "00" then
						p_next <= p0;
					elsif mode = "01" then
						p_next <= p3;
					else
						p_next <= p3;
					end if;
				when others =>
					p_next <= p3;
			end case;
		end if;
	end process;
	
	process(clk, reset)
	begin
		if reset = '0' then
			p_present <= p0;
		elsif rising_edge(clk) then
			p_present <= p_next;
		end if;
	end process;
	
	p_number <= 
			std_logic_vector(to_unsigned(0,8)) when p_present = p0 else
			std_logic_vector(to_unsigned(2,8)) when p_present = p2 else
		 	std_logic_vector(to_unsigned(3,8)) when p_present = p3 else
 			std_logic_vector(to_unsigned(5,8)) when p_present = p5 else
			std_logic_vector(to_unsigned(7,8)) when p_present = p7 else
			std_logic_vector(to_unsigned(11,8)) when p_present = p11 else
			std_logic_vector(to_unsigned(13,8)) when p_present = p13 else
			std_logic_vector(to_unsigned(17,8)) when p_present = p17 else
			std_logic_vector(to_unsigned(19,8)) when p_present = p19 else
			std_logic_vector(to_unsigned(23,8)) when p_present = p23 else
			std_logic_vector(to_unsigned(29,8)) when p_present = p29 else
			std_logic_vector(to_unsigned(31,8)) when p_present = p31 else
			std_logic_vector(to_unsigned(37,8)) when p_present = p37 else
			std_logic_vector(to_unsigned(41,8)) when p_present = p41 else
			std_logic_vector(to_unsigned(43,8)) when p_present = p43 else
			std_logic_vector(to_unsigned(47,8)) when p_present = p47 else
			std_logic_vector(to_unsigned(53,8)) when p_present = p53 else
			std_logic_vector(to_unsigned(59,8)) when p_present = p59 else
			std_logic_vector(to_unsigned(61,8)) when p_present = p61 else
			std_logic_vector(to_unsigned(67,8)) when p_present = p67 else
			std_logic_vector(to_unsigned(71,8)) when p_present = p71 else
			std_logic_vector(to_unsigned(73,8)) when p_present = p73 else
			std_logic_vector(to_unsigned(79,8)) when p_present = p79 else
			std_logic_vector(to_unsigned(83,8)) when p_present = p83 else
			std_logic_vector(to_unsigned(89,8)) when p_present = p89 else
			std_logic_vector(to_unsigned(97,8)) when p_present = p97;
end behavior;
