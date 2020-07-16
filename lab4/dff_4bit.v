module dff_4bits(q, d, clk, rst_n);
input clk, rst_n;
input [3:0] d;
output [3:0] q;
reg [3:0]q;
always @(posedge clk or negedge rst_n)begin
	if (!rst_n) q <= 0;
	else q <= d;
end
endmodule
