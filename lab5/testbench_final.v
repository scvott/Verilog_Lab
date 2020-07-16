module traffic_light_test ;
	reg clk, rst_n;
	wire g1, y1, r1, g2, y2, r2;
	reg [4:0] pass;
	traffic_light M0 ( .clk(clk), .rst_n(rst_n), .g1(g1), .y1(y1), .r1(r1), .g2(g2), .y2(y2), .r2(r2) ) ;

	always begin
		#5
		clk = ~clk ;
	end

	initial begin
		clk = 0 ;
		rst_n = 0 ;
		pass=0;
		#10 
		rst_n = 1 ;
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==0&&y1==1&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==0&&y1==0&&y2==1&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==1&&g2==0&&y1==0&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==0&&y1==1&&y2==0&&r1==0&&r2==1)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		#10
			if (g1==0&&g2==1&&y1==0&&y2==0&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
		
		#10
			if (g1==0&&g2==0&&y1==0&&y2==1&&r1==1&&r2==0)
				pass=pass+1;
			else
				$display ("Error!") ;
				
		if (pass==16)
			$display("PASS!");
		$finish;
	end

	initial begin
		$monitor ( "time=%4d, clk=%b, rst_n=%b, r1=%b, g1=%b, y1=%b, r2=%b, g2=%b, y2=%b",
			$time, clk, rst_n, r1, g1, y1, r2, g2, y2 ) ;
	end	
	initial begin
 	                $fsdbDumpfile ("trafficlight.fsdb");
 	                $fsdbDumpvars ;
 	end
 	                                        
endmodule
