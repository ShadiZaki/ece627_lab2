clean:
	rm -Rf vivado.* work a.out transcript lab2.vcd vsim.wlf lab2_vivado counter.edif

iverilog:
	iverilog dut_tb.v counter.v 
	./a.out
	gtkwave lab2.vcd

iverilog-txt:
	iverilog dut_tb.v counter.v 
	./a.out

modelsim:	
	vsim -do lab2-sim.tcl

modelsim-txt:
	vsim -c -do lab2-sim.tcl

vivado:
	rm -rf vivado*
	rm -rf lab2_vivado
	vivado -source lab2-syn.tcl

vivado-txt:
	rm -rf vivado*
	rm -rf lab2_vivado
	vivado -mode tcl -source lab2-syn.tcl

yosys:
	rm -Rf counter.edif
	yosys lab2-syn.ys &> utilization.txt
