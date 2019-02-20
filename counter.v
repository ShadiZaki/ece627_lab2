module counter #(parameter WIDTH = 32, parameter HEIGHT = 32)(
	input clk,
	input rst,
	input enable,
	output reg [$clog2(WIDTH)-1:0] column_counter,
	output reg [$clog2(HEIGHT)-1:0] row_counter
	);

	reg flag = 0;

	always @(posedge clk)
	begin
		if(rst)
		begin
			column_counter <= 0;
		end
		else
		begin
			if(enable)
			begin
				if(column_counter == WIDTH-2)
				begin
					flag <= 1;
				end
				else
				begin
					flag <= 0;
				end
				column_counter <= (column_counter + 1) % WIDTH;
			end
		end
	end

	always @(posedge clk)
	begin
		if(rst)
		begin
			row_counter <= 0;
		end
		else
		begin
			if(flag && enable)
			begin
				row_counter <= (row_counter + 1) % HEIGHT;
			end
		end
	end

	// parameter RST = 0;
	// parameter COUNT = 1;

	// reg state_col;
	// reg state_row;

	// always @(posedge clk)
	// begin
	// 	if(rst)
	// 	begin
	// 		state_col <= RST;
	// 	end
	// 	else
	// 	begin
	// 		case(state_col)
	// 		RST: if(enable) state_col <= COUNT;
	// 		COUNT: state_col <= COUNT;
	// 		default: state_col <= RST;
	// 		endcase
	// 	end
	// end

	// always @(posedge clk)
	// begin
	// 	if(rst)
	// 	begin
	// 		column_counter <= 0;
	// 	end
	// 	else
	// 	begin
	// 		case(state_col)
	// 		RST:
	// 		begin
	// 			column_counter <= 0;
	// 			if(enable) column_counter <= (column_counter + 1) % WIDTH;
	// 		end
	// 		COUNT:
	// 		begin
	// 			if(enable) column_counter <= (column_counter + 1) % WIDTH;
	// 			if(column_counter == WIDTH-2)
	// 			begin
	// 				flag <= 1;
	// 			end
	// 			else
	// 			begin
	// 				flag <= 0;
	// 			end
	// 		end
	// 		default: column_counter <= 0;
	// 		endcase
	// 	end
	// end

	// always @(posedge clk)
	// begin
	// 	if(rst)
	// 	begin
	// 		state_row <= RST;
	// 	end
	// 	else
	// 	begin
	// 		case(state_row)
	// 		RST: if(enable && flag) state_row <= COUNT;
	// 		COUNT: state_row <= COUNT;
	// 		default: state_row <= RST;
	// 		endcase
	// 	end
	// end

	// always @(posedge clk)
	// begin
	// 	if(rst)
	// 	begin
	// 		row_counter <= 0;
	// 	end
	// 	else
	// 	begin
	// 		case(state_row)
	// 		RST:
	// 		begin
	// 			row_counter <= 0;
	// 			if(enable && flag) row_counter <= (row_counter + 1) % HEIGHT;
	// 		end
	// 		COUNT: if(enable && flag) row_counter <= (row_counter + 1) % HEIGHT;
	// 		default: row_counter <= 0;
	// 		endcase
	// 	end
	// end
endmodule