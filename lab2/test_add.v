module add_sub(a,b,add,result);
input [7:0]a,b;
input add;
output [9:0] result;
assign result = (add)?(a+b):(a-b);
endmodule