----------------------------------------------------------------------------------
-- Company: Fontys University of applied sciences
-- Engineer: Emmily Jansen
-- 
-- Create Date: 30.03.2016 08:29:10
-- Design Name: 
-- Module Name: DCS - Structural
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
-- This is the main file used in the internship of Emmily Jansen. This contains
-- a structural model of the blocks needed to implement a distributed control
-- system. 
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

entity DCS is
    Port (clk  : in STD_LOGIC;
          nrst : in STD_LOGIC;
          --Write ports
          awaddr  : in STD_LOGIC_VECTOR(6 downto 0);
          awvalid : in STD_LOGIC;
          awready : out STD_LOGIC;
          wdata   : in STD_LOGIC_VECTOR(31 downto 0);
          wstrobe : in STD_LOGIC_VECTOR(3 downto 0);
          wvalid  : in STD_LOGIC;
          wready  : out STD_LOGIC;
          bresp   : out STD_LOGIC_VECTOR(1 downto 0);
          bvalid  : out STD_LOGIC;
          bready  : in STD_LOGIC;
          --Read ports
          araddr  : in STD_LOGIC_VECTOR(6 downto 0);
          arvalid : in STD_LOGIC;
          arready : out STD_LOGIC;
          rdata   : out STD_LOGIC_VECTOR(31 downto 0);
          rvalid  : out STD_LOGIC;
          rready  : in STD_LOGIC);
end DCS;

architecture Structural of DCS is

begin


end Structural;
