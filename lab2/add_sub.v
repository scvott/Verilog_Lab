module add_sub ( add, a, b, cin, sum, cout, overflow); 
	input add; 
	input [3:0] a,b; 
	input cin; 
	output [3:0] sum; 
	output cout, overflow; 
	wire [3:0]f;
	assign f = (add)?b:(~b+1);
	assign {cout,sum} = a+f+cin;
	assign overflow = (a[3])?(f[3]?(sum[3]? 0:1):0):(f[3]? 0:(sum[3]? 1:0));
endmodule 
