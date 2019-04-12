----------------------------------------------------------------------------------
-- Company: Fontys University of applied sciences
-- Engineer: Emmily Jansen
-- 
-- Create Date: 29.03.2016 14:13:12
-- Design Name: 
-- Module Name: clk_div - Functional
-- Project Name: 
-- Target Devices: ZedBoard
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

entity PID is
    Port ( clk_in  : in STD_LOGIC;
           nrst    : in STD_LOGIC;
           divider : in STD_LOGIC_VECTOR(31 downto 0);
           clk_out : out STD_LOGIC);
end PID;
