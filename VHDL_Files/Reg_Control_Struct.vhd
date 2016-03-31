----------------------------------------------------------------------------------
-- Company: Fontys University of applied sciences
-- Engineer: Emmily Jansen
-- 
-- Create Date: 30.03.2016 14:49:10
-- Design Name: 
-- Module Name: Reg_In - Sturctural
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

entity Reg_In is
    Port (clk  : in STD_LOGIC;
          nrst    : in STD_LOGIC;
          awaddr  : in STD_LOGIC_VECTOR(6 downto 0);
          awvalid : in STD_LOGIC;
          awready : out STD_LOGIC;
          wdata   : in STD_LOGIC_VECTOR(31 downto 0);
          wstrobe : in STD_LOGIC_VECTOR(3 downto 0);
          wvalid  : in STD_LOGIC;
          wready  : out STD_LOGIC;
          bresp   : out STD_LOGIC_VECTOR(1 downto 0);
          bvalid  : out STD_LOGIC;
          bready  : in STD_LOGIC);
end Reg_In;

architecture Structural of Reg_In is

begin
  
end Structural;