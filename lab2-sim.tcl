vlib work
vlog dut_tb.v counter.v
vsim dut_tb
log -r /*
add wave sim:/dut_tb/*
config wave -signalnamewidth 1
run 10250 ns
