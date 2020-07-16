module add_sub ( add, a, b, cin, sum, cout, overflow); 
	input add; 
	input [7:0] a,b; 
	input cin; 
	output [7:0] sum; 
	output cout, overflow; 
	wire [7:0]f;
	assign f = (add)?b:(~b+1);
	assign {cout,sum} = a+f+cin;
	assign overflow = (a[7])?(f[7]?(sum[7]? 0:1):0):(f[7]? 0:(sum[7]? 1:0));
endmodule 
