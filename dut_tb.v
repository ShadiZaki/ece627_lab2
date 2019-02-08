module dut_tb
#
(
	parameter	WIDTH 	= 32,
	parameter	HEIGHT	= 32
)
();


reg     clk=1'b0;
reg     [1:0] rst;
wire    [$clog2(WIDTH)-1:0]     column_counter;
wire    [$clog2(HEIGHT)-1:0]    row_counter;
wire    enable;

always #0.5 clk = ~clk;

initial begin
        rst = 2'b11;
end

always@(posedge clk)
begin
	rst <= rst>>1;
	$monitor("Time=%0d,Row=%0d,Column=%0d",$time,row_counter,column_counter);
	if($time>=1024*2+16) begin
		$finish;
	end
end

assign  enable = 1;

counter
#(
	.WIDTH		(WIDTH),
	.HEIGHT		(HEIGHT)
)
counter_dut
(
	.clk		(clk),
	.rst		(rst[0]),
	.enable		(enable),
	.column_counter	(column_counter),
	.row_counter	(row_counter)
);

initial begin
	$dumpfile("lab2.vcd");
	$dumpvars;
end

endmodule
