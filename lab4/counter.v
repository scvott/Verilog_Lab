module counter (clk, rst_n, result);
	input clk, rst_n;
	output [3:0] result;
	wire [3:0]sum;
	adder A0(result, 4'd3, sum);
	dff_4bits D0(result, sum, clk, rst_n);
endmodule
