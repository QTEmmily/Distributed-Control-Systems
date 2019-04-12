----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2016 10:12:53
-- Design Name: 
-- Module Name: Blink - Behavioral
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

entity Blink is
    Port ( clk : in STD_LOGIC;
           nrst : in STD_LOGIC;
           --speed : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end Blink;

architecture Functional of Blink is
    signal led_int : std_logic_vector(3 downto 0);
begin

    process(clk, nrst)
    begin
        if nrst = '1' then
            led_int <= "0001";
        elsif clk'event and clk = '1' then
            led_int <= led_int(0) & led_int(3 downto 1);
        end if;
        led <= led_int;
    end process;

end Functional;
