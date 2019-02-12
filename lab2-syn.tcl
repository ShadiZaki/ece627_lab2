create_project -force lab2 ./lab2_vivado -part xc7z020clg400-1
set_property board_part www.digilentinc.com:pynq-z1:part0:1.0 [current_project]
read_verilog -sv counter.v
synth_design -generic WIDTH=32 -generic HEIGHT=32 -top counter -mode out_of_context;
opt_design
report_utilization -file utilization.txt