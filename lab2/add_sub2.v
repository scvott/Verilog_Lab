module add_sub ( add, a, b, cin, sum, cout, overflow);
output cout,overflow;
output [3:0]sum;
input [3:0]a,b;
input cin,add;
wire [3:1]c;
wire[3:0]d;
wire overflow;


assign d[0] = add ^ b[0];
assign d[1] = add ^ b[1];
assign d[2] = add ^ b[2];
assign d[3] = add ^ b[3];
assign overflow = c[2] ^ c[3];
fulladder FA0(a[0],d[0],cin,c[1],sum[0]);
fulladder FA1(a[1],d[1],c[1],c[2],sum[1]);
fulladder FA2(a[2],d[2],c[2],c[3],sum[2]);
fulladder FA3(a[3],d[3],c[3],cout,sum[3]);

endmodule
