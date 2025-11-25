----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2025 05:01:09 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
    generic (n : integer := 32);
    Port (
        clk : in  STD_LOGIC;
        a   : in  STD_LOGIC_VECTOR(n-1 downto 0);
        b   : in  STD_LOGIC_VECTOR(n-1 downto 0);
        sum : out STD_LOGIC_VECTOR(n-1 downto 0);
        carry : out std_logic
    );
end ripple_adder;

architecture pipelined of ripple_adder is
    signal s     : STD_LOGIC_VECTOR(n-1 downto 0);
    signal s_reg : STD_LOGIC_VECTOR(n-1 downto 0);
begin
    -- Combinational ripple adder
    s <= std_logic_vector(unsigned(a) + unsigned(b));

    -- Pipelined register stage
    process(clk)
    begin
        if rising_edge(clk) then
            s_reg <= s;
            sum   <= s_reg;
        end if;
    end process;
    
    process(clk)
    begin
        
    end process;
end pipelined;
