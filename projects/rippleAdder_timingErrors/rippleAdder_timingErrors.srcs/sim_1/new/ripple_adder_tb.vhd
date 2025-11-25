----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2025 03:56:53 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is

component ripple_adder_pipelined is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal clk : std_logic := '0';
signal a,b,sum : std_logic_vector(15 downto 0) := (others => '0');
signal time_period : time := 10ns;

begin

UUT : ripple_adder_pipelined port map (a=>a, b=>b, clk=>clk, sum=>sum);  

clock_process : process
begin
    clk <= not clk;
    wait for time_period/2;
end process;

input_process : process
begin 

    a <= std_logic_vector(to_unsigned(16, 16));
    b <= std_logic_vector(to_unsigned(16, 16));
    
    
    wait for 10 * time_period;
    
    a <= std_logic_vector(to_unsigned(4095, 16));
    b <= std_logic_vector(to_unsigned(8191, 16));
    
    wait;
    
end process;

end Behavioral;
