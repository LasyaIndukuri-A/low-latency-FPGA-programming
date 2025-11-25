----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2025 12:08:35 PM
-- Design Name: 
-- Module Name: ripple_adder_pipelined - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use ieee.std_logic_arith.all;  
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_pipelined is
    Port ( clk : in STD_LOGIC;
           reset : in std_logic;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0));
end ripple_adder_pipelined;

architecture Behavioral of ripple_adder_pipelined is
    signal s0,s1,s2,s3 : std_logic_vector(3 downto 0) := (others=> '0');
    signal c0,c1,c2,c3 : unsigned(3 downto 0) := (others=> '0'); 
    
    signal s_s0,s_s1,s_s2 : std_logic_vector(3 downto 0) := (others=> '0');
    signal s_c0,s_c1,s_c2,s_c3 : unsigned(3 downto 0) := (others=> '0'); 
    
begin
P_COMB : process(a,b,s_c0, s_c1,s_c2)
        variable tmp_sum : unsigned(4 downto 0) := (others=>'0');
    begin   
            tmp_sum := unsigned('0' & a(3 downto 0)) + unsigned('0' & b(3 downto 0));
            c0(0) <= tmp_sum(4);
            s0 <= std_logic_vector(tmp_sum(3 downto 0));
            
            tmp_sum := unsigned('0' & a(7 downto 4)) + unsigned('0' & b(7 downto 4)) + s_c0;
            c1(0) <= tmp_sum(4);
            s1 <= std_logic_vector(tmp_sum(3 downto 0));
            
            tmp_sum := unsigned('0' & a(11 downto 8)) + unsigned('0' & b(11 downto 8)) + s_c1;
            c2(0) <= tmp_sum(4);
            s2 <= std_logic_vector(tmp_sum(3 downto 0));
            
            tmp_sum := unsigned('0' & a(15 downto 12)) + unsigned('0' & b(15 downto 12)) + s_c2;
            c3(0) <= tmp_sum(4);
            s3 <= std_logic_vector(tmp_sum(3 downto 0));
  
            -- sum <= std_logic_vector(resize(c1, 16)); --& resize(c1, 4) & resize(c2, 4) & resize(c3, 4);      
    end process P_COMB;
    
P_seq : process(clk) 
begin
--    if reset = '0' then
--        s_c0 <= (others=>'0');
--        s_c1 <= (others=>'0');
--        s_c2 <= (others=>'0');
--        s_c3 <= (others=>'0');
            
--        s_s0 <= (others=>'0');
--        s_s1 <= (others=>'0');
--        s_s2 <= (others=>'0');
            
--        sum <= (others=>'0');
--    end if;
        if rising_edge(clk) then
            s_c0 <= c0;
            s_c1 <= c1;
            s_c2 <= c2;
            s_c3 <= c3;
            
            s_s0 <= s0;
            s_s1 <= s1;
            s_s2 <= s2;
            
            sum <= s3 & s_s2 & s_s1 & s_s0;
        end if;
    end process P_seq;

end Behavioral;
