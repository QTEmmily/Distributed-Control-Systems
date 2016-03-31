add wave sim:/clk_div/*
run 300
force sim:/clk_div/clk_in 1 0, 0 {50 ns} -r 100
run 400
force sim:/clk_div/nrst 1 0
run 400
force sim:/clk_div/nrst 0 0
run 100
force sim:/clk_div/nrst 1 0
run 400
force sim:/clk_div/divider 00000000000000000000000000000000 0
run 2000
force sim:/clk_div/divider 00000000000000000000000000000001 0
run 2000
force sim:/clk_div/divider 00000000000000000000000000000011 0
run 2000