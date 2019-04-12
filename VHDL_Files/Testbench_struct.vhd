library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Testbench_struct is
  port(
    sys_clk : in std_logic;
    rst_n : in std_logic
    --Output : out integer
  );
end Testbench_struct;


architecture Structural of Testbench_struct is
  component Testbench is
    port(
      sys_clk : in std_logic;
      rst_n : in std_logic;
      Position : out std_logic_vector(31 downto 0);
      Setpoint : out std_logic_vector(31 downto 0);
      Ki : out std_logic_vector(31 downto 0);
      Kp : out std_logic_vector(31 downto 0);
      Kd : out std_logic_vector(31 downto 0);
      Output : in std_logic_vector(31 downto 0)
    );
  end component;
  
  component PID is
    generic(
      MAX_VAL : integer := 819200000;
      MIN_VAL : integer := -819200000;
      clk_div : integer := 100
    );
    port(
      sys_clk : in std_logic;
      rst_n : in std_logic;
      Position : in std_logic_vector(31 downto 0);
      Setpoint : in std_logic_vector(31 downto 0);
      Ki : in  std_logic_vector(31 downto 0);
      Kp : in  std_logic_vector(31 downto 0);
      Kd : in std_logic_vector(31 downto 0);
      Output : out std_logic_vector(31 downto 0);
      State_out : out std_logic_vector(31 downto 0);
      Emerg : out std_logic_vector(31 downto 0)
    );
  end component;
  
  signal int_pos : std_logic_vector(31 downto 0);
  signal int_setpoint : std_logic_vector(31 downto 0);
  signal int_Ki : std_logic_vector(31 downto 0);
  signal int_Kp : std_logic_vector(31 downto 0);
  signal int_Kd : std_logic_vector(31 downto 0);
  signal int_outp : std_logic_vector(31 downto 0);
  
begin
  Test_PID : PID
  port map(
    sys_clk => sys_clk,
    rst_n => rst_n,
    Position => int_pos,
    Setpoint => int_setpoint,
    Ki => int_Ki,
    Kd => int_Kd,
    Kp => int_Kp,
    Output => int_outp    
  );
  
  Test_Testbench : Testbench
  port map(
    sys_clk => sys_clk,
    rst_n => rst_n,
    Position => int_pos,
    Setpoint => int_setpoint,
    Ki => int_Ki,
    Kd => int_Kd,
    Kp => int_Kp,
    Output => int_outp
  );
    
end Structural;
