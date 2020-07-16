module half_adder(s,c,x,y);
output s,c;
input x,y;
xor(s,x,y);
and(c,x,y);

endmodule
