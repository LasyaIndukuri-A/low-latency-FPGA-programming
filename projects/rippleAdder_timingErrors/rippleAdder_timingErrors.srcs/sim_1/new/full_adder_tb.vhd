----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2025 10:46:19 AM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is


component full_adder is
    Port ( clk : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           s : out STD_LOGIC;
           carry : out STD_LOGIC
           );
end component;

signal clk, a, b, sum, carry : std_logic := '0';
signal time_period : time := 10ns;

begin

UUT: full_adder port map (clk=>clk, A=>a, B=>b, s=>sum, carry=>carry);

clock_process : process
begin
    clk <= not clk;
    wait for time_period/2;
end process;

input_process : process
begin 
    a <= '0';
    b <= '0';
    
    wait for 3 * time_period;
    
    a <= '0';
    b <= '1';
    
    wait for 3 * time_period;
    
    a <= '1';
    b <= '0';
    
    wait for 3 * time_period;
    
    a <= '1';
    b <= '1';
    
    wait;
    
end process input_process;

end Behavioral;
