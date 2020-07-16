module elev_ctrl_test ;
	wire [3:0]floor;
	wire up,down;
	reg [3:0]target;
	reg clk,rst_n;
	elev_ctrl E0 ( .clk(clk), .rst_n(rst_n), .up(up), .down(down), .floor(floor), .target(target)  ) ;
	
	always begin
		#5
		clk = ~clk ;
	end
	initial begin
		clk = 0 ;
		rst_n = 0 ;
		target = 0;
		#20
		rst_n = 1;
		target = 1;
		#20
		target = 5;
		#40
		target = 5;
		#20
		target = 3;
		#30
		target = 1;
		#20
		target = 15;
		#140
		$finish;	
	end
	
	initial begin
		$monitor ( "time=%4d, clk=%b, rst_n=%b, up=%b, down=%b, floor=%d, target=%d",$time, clk, rst_n, up, down, floor, target) ;
	end
	
endmodule
