module half_adder(s,c,x,y);
output s,c;
input x,y;

assign s=x^y;
assign c=x&y;

endmodule

