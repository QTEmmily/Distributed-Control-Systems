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

entity clk_div is
    Port ( clk_in  : in STD_LOGIC;
           nrst    : in STD_LOGIC;
           divider : in STD_LOGIC_VECTOR(31 downto 0);
           clk_out : out STD_LOGIC);
end clk_div;

architecture Functional of clk_div is
signal counter : integer := -1;
signal div : integer := -1;
signal reset : std_logic;

Function bin2int(word : in Std_Logic_vector) return integer is
Variable result : integer;
Begin                                          
  result := 0;
    FOR i in word'range LOOP
      IF word(i) = '1' THEN
        result := result + 2**i;
      ELSIF word(i) /= '0' THEN
        result := -1;
        EXIT;
      END IF;
    END LOOP;
  Return result;
END bin2int;

begin
  process (clk_in, nrst)
  begin
    if nrst = '0' then
      counter <= 0;
      reset <= '0';
    elsif nrst = '1' and clk_in'event and clk_in = '1' then
      if div > -1 then
        counter <= (counter + 1) REM (div+2) after 10 ns;
      end if;
      reset <= '1';
    end if;
    div <= bin2int(divider);
  end process;
  
  process (counter, reset)
    variable prev_state : std_logic;
    begin
      if counter = -1 then
        clk_out <= 'X';
      elsif counter = 0 and reset = '1' then
        prev_state := not(prev_state);
      elsif reset = '0' then
        prev_state := '0';
      end if;
      clk_out <= prev_state after 10 ns;
    end process;
end Functional;
