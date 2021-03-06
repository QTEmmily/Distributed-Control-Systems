----------------------------------------------------------------------------------
-- Company: Fontys University of applied sciences
-- Engineer: Emmily Jansen
-- 
-- Create Date: 29.03.2016 14:13:12
-- Design Name: 
-- Module Name: counter - Functional
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

entity counter is
    Port ( clk     : in STD_LOGIC;
           nrst    : in STD_LOGIC;
           enab_cnt: in STD_LOGIC;
           address : out integer range -1 to 15);
end counter;


architecture functional of counter is
signal counter : integer range -1 to 15;
begin
  process (clk, nrst)
    begin
      if nrst = '0' then
        counter <= 0 after 10 ns;
      elsif clk'event and clk = '1' then
        if enab_cnt = '1' then
          counter <= (counter + 1) REM 14 after 10 ns;
        elsif enab_cnt /= '0' then
          counter <= -1 after 10 ns;
        end if;
      end if;
      address <= counter;          
    end process;
end functional;