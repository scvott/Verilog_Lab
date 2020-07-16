module counter_test;

	wire [3:0]result;
	reg clk, rst_n;
	reg [3:0]golden;
	reg [31:0] i ;
	counter M0 ( .clk(clk), .rst_n(rst_n), .result(result) );
	always begin
		#5
		clk = ~clk ;
	end
	initial begin
		clk = 0 ;
		rst_n = 0 ;
		golden = 0 ;
		@(posedge clk)
		#1
		rst_n = 1 ;
		#1
		$display ("result: %d, golden: %d" , result , golden) ;
		if ( golden == result )
			;// do nothing
		else begin
			$display("Error!");
			$finish ;
		end
		for ( i = 0 ; i < 100 ; i = i + 1 ) begin
			@(posedge clk)
			#1
			golden = golden + 3 ;
			#1
			$display ("result: %d, golden: %d" , result , golden) ;
			if ( golden == result )
				;// do nothing
			else begin
				$display("Error!");
				$finish ;
			end
		end
		
		
		$display("Pass!");
		
		$finish;
	end
	initial begin
          $fsdbDumpfile ( "counter.fsdb" ) ;
          $fsdbDumpvars ;
        end



endmodule
