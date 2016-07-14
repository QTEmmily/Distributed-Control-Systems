do C:/Users/QTrooper/Documents/GitHub/Distributed-Control-Systems/VHDL_Files/wave.do
run 200 ns
force -freeze sim:/testbench_struct/rst_n 0 0
run 200 ns
force -freeze sim:/testbench_struct/sys_clk 1 0, 0 {50 ns} -r 100
run 100 ns
force -freeze sim:/testbench_struct/rst_n 1 0
run 110 ns
force -freeze sim:/testbench_struct/rst_n 0 0
run 1300 us
