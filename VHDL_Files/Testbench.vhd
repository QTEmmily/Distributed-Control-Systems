library IEEE;
use IEEE.std_logic_1164.all;


entity Testbench is
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
end Testbench;


architecture functional of Testbench is
signal counter : integer := -1;
signal counter2 : integer := -1;
signal int_pos : std_logic_vector(31 downto 0);

    function add (in1 : std_logic_vector; in2 : std_logic) return std_logic_vector is
    variable tmp1 : std_logic_vector(31 downto 0); --output
    variable tmp2 : std_logic_vector(32 downto 0); --borrow
    variable xorout :std_logic;
    variable andout :std_logic;
    variable andout2 :std_logic;
    begin
        tmp2(0) := in2;
        for i in in1'LOW to in1'HIGH loop
            xorout := in1(i) xor '0';
            andout2 := in1(i) and '0';
            andout := xorout and tmp2(i);
            tmp1(i) := tmp2(i) xor xorout;
            tmp2(i+1) := andout or andout2;
        end loop;
        return tmp1; 
    end; 

begin
  process(sys_clk, rst_n)
    begin
      if rst_n = '1' then
        int_pos <= x"00_00_00_00";
        Kp <= x"00_00_00_01";--x"00_06_1A_80"; --400.000, 4 multiplied by 100.000
        Ki <= x"00_00_00_01";--x"00_00_00_64"; --100, 0.001 multiplid by 100.000
        Kd <= x"00_00_00_01";--x"00_03_0D_40"; --200.000, 2 multiplied by 100.000
        Setpoint <= x"02_25_51_00"; --36.000.000, 360 degrees (or one rotation) multiplied by 100.000
        counter <= 0;
        counter2 <= 0;
        Position <= x"00_00_00_00";
      elsif sys_clk'event and sys_clk = '1' then
        counter <= (counter + 1) rem 10;
        counter2 <= counter2 + 1;
        if counter = 0 and int_pos < x"3E8"  then --Increase the position with one until it
          int_pos <= add(int_pos, '1');           --has reached 1000 counts, which equates to
        end if;                                   --2 full rotations of the enncoder (500
        Position <= int_pos;                      --counts per rotation)
      end if;
    end process;
end functional; 