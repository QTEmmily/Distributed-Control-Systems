----------------------------------------------------------------------------------
-- Company: Fontys University of applied sciences
-- Engineer: Emmily Jansen
-- 
-- Create Date: 29.03.2016 14:13:12
-- Design Name: 
-- Module Name: Register - Functional
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

entity Reg_in is
    Port ( clk     : in STD_LOGIC;
           ld_data : in STD_LOGIC;
           rdata   : in STD_LOGIC_VECTOR(31 downto 0);
           address : in integer range -1 to 31;
           Setpoint: out STD_LOGIC_VECTOR(31 downto 0);
           Kp      : out STD_LOGIC_VECTOR(31 downto 0);
           Ki      : out STD_LOGIC_VECTOR(31 downto 0);
           Kd      : out STD_LOGIC_VECTOR(31 downto 0);
           Update  : out STD_LOGIC_VECTOR(31 downto 0);
           clk_div : out STD_LOGIC_VECTOR(31 downto 0)
         );
end Reg_in;

architecture functional of Reg_in is
type Reg is array(31 downto 0) of std_logic_vector(31 downto 0);
signal Reg_bank : Reg;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if ld_data = '1' then
        Reg_bank(address) <= rdata;
      elsif  ld_data /= '0' or address = -1 then
        Reg_bank <= (others => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
      end if;
    end if;
    
    Setpoint <= Reg_bank(0);
    Kp       <= Reg_bank(1);
    Ki       <= Reg_bank(2);
    Kd       <= Reg_bank(3);
    Update   <= Reg_bank(4);
    clk_div  <= Reg_bank(0);
  end process;    
end functional;
