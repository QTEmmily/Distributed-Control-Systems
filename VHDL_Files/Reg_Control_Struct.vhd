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

entity Reg_Struct is
    Port (clk     : in STD_LOGIC;
          nrst    : in STD_LOGIC;
          araddr  : out STD_LOGIC_VECTOR(4 downto 0);
          arvalid : out STD_LOGIC;
          arready : in STD_LOGIC;
          rdata   : in STD_LOGIC_VECTOR(31 downto 0);
          rvalid  : in  STD_LOGIC;
          rready  : out STD_LOGIC;
          Setpoint: out STD_LOGIC_VECTOR(31 downto 0);
          Kp      : out STD_LOGIC_VECTOR(31 downto 0);
          Ki      : out STD_LOGIC_VECTOR(31 downto 0);
          Kd      : out STD_LOGIC_VECTOR(31 downto 0);
          Update  : out STD_LOGIC_VECTOR(31 downto 0);
          clk_div : out STD_LOGIC_VECTOR(31 downto 0));
end Reg_Struct;

architecture Structural of Reg_Struct is
component Controller
    Port (clk     : in STD_LOGIC;
          nrst    : in STD_LOGIC;
          araddr  : out STD_LOGIC_VECTOR(4 downto 0);
          arvalid : out STD_LOGIC;
          arready : in STD_LOGIC;
          rvalid  : in STD_LOGIC;
          address : in integer range -1 to 31;
          addr_out: out integer range -1 to 31;
          ld_data : out STD_LOGIC;
          enab_cnt: out STD_LOGIC;
          rready  : out STD_LOGIC);
end component;
component Reg_in
  Port (clk     : in STD_LOGIC;
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
end component;
component Counter
  Port (clk     : in STD_LOGIC;
        nrst    : in STD_LOGIC;
        enab_cnt: in STD_LOGIC;
        address : out integer range -1 to 31);
end component;

for all : Controller use entity work.controller(functional);
for all : Reg_in use entity work.Reg_in(functional);
for all : Counter use entity work.Counter(functional);

signal enab_cnt : std_logic;
signal ld_data  : std_logic;
signal addr_out : integer range -1 to 31;
signal address  : integer range -1 to 31;
begin
  Control : Controller port map(
        clk     => clk,
        nrst    => nrst,
        araddr  => araddr,
        arvalid => arvalid,
        arready => arready,
        rvalid  => rvalid,
        address => address,
        addr_out=> addr_out,
        ld_data => ld_data,
        enab_cnt=> enab_cnt,
        rready  => rready
                                );
  Reg      : Reg_in     port map(
        clk     => clk,
        ld_data => ld_data,
        rdata   => rdata,
        address => addr_out,
        Setpoint=> Setpoint,
        Kp      => Kp,
        Ki      => Ki,
        Kd      => Kd,
        Update  => Update,
        clk_div => clk_div
                                );
  Count   : Counter    port map(
        clk     => clk,
        nrst    => nrst,
        enab_cnt=> enab_cnt,
        address => address
                                );
end Structural;