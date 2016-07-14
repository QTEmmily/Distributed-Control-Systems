Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity teller is
  port (  clk : in std_logic;
          nrst : in std_logic;
          output: out std_logic_vector(7 downto 0)
          );
end teller;

architecture functional of teller is
signal teller : std_logic_vector(7 downto 0);
begin
  process (clk, nrst)
  begin
    if nrst = '1' then
      output <= "00000000";
      teller <= "00000000";
    elsif clk'event and clk = '1' and nrst = '0'then
      teller <= teller + 1;
    end if;
    output <= teller;
  end process;
end functional;
  