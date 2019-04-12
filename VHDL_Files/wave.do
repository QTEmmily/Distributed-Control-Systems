onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider clk_inp_outp
add wave -noupdate -format Logic /testbench_struct/sys_clk
add wave -noupdate -format Logic /testbench_struct/rst_n
add wave -noupdate -format Analog-Step -height 74 -max 8192.0 -min -0.0 -radix decimal /testbench_struct/test_pid/output
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/prev_val
add wave -noupdate -format Literal /testbench_struct/test_pid/counter
add wave -noupdate -format Literal /testbench_struct/test_pid/prev_count
add wave -noupdate -divider error_calc
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/degrees
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/error
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_setpoint
add wave -noupdate -divider P_action_proc
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_kp
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/p_action
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/error
add wave -noupdate -divider I_action_proc
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_ki
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/error
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/i_action
add wave -noupdate -format Literal /testbench_struct/test_pid/icount
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/iterm
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_iterm
add wave -noupdate -divider D_action_proc
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_kd
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/last_pos
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/d_action
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/prev_val
add wave -noupdate -format Literal /testbench_struct/test_pid/prev_count
add wave -noupdate -divider output_calc
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/p_action
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/i_action
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/d_action
add wave -noupdate -format Analog-Step -max 8192.0 -min -8192.0 -radix decimal /testbench_struct/test_pid/int_outp
add wave -noupdate -divider convert
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/position
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_pos
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/setpoint
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_setpoint
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/kp
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_kp
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/ki
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_ki
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/kd
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_kd
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/int_outp
add wave -noupdate -format Analog-Step -height 74 -max 8192.0 -min -0.0 -radix decimal /testbench_struct/test_pid/vec_outp
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/emerg
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_pid/state_out
add wave -noupdate -format Logic /testbench_struct/test_pid/dir
add wave -noupdate -format Logic /testbench_struct/test_pid/enable
add wave -noupdate -divider Internal_clock
add wave -noupdate -format Literal /testbench_struct/test_pid/state
add wave -noupdate -format Literal /testbench_struct/test_pid/clk_int
add wave -noupdate -format Logic /testbench_struct/test_pid/clk_out
add wave -noupdate -divider Testbench
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/position
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/setpoint
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/kp
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/ki
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/kd
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/output
add wave -noupdate -format Literal /testbench_struct/test_testbench/counter
add wave -noupdate -format Literal /testbench_struct/test_testbench/counter2
add wave -noupdate -format Literal -radix decimal /testbench_struct/test_testbench/int_pos
add wave -noupdate -divider Structural
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_kp
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_ki
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_kd
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_pos
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_setpoint
add wave -noupdate -format Literal -radix decimal /testbench_struct/int_outp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1085777422 ps} 0}
configure wave -namecolwidth 305
configure wave -valuecolwidth 152
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1620346 ns}
