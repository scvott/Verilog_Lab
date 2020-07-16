module add_sub_test ;
	reg signed [7:0] a , b ;
	reg [31:0] error;
	reg add ;
	reg signed [7:0] result_golden ;
	reg overflow_golden ;
	wire signed [7:0] result ;
	wire overflow ;

	add_sub M0 ( .add(add), .a(a), .b(b), .result(result), .overflow(overflow)); 
	initial begin
		error = 0 ;
		#1
		for(a=-127;a<=126;a=a+1) begin
			for(b=-127;b<=126;b=b+1) begin
				add = 1 ;
				result_golden = a+b ;
				if (a[7]==b[7]&&a[7]!==result_golden[7])overflow_golden=1;
				else overflow_golden=0;
				#10
				$display("a=%d, b=%d, add=%b, result=%d, overflow=%b",a,b,add,result,overflow );
				if ( result !== result_golden || overflow !== overflow_golden ) begin
					$display ( "Error: golden is %d, %d" , result_golden , overflow_golden ) ;
					$finish ;
				end
				#1
				#10
				add = 0 ;
				result_golden = a-b ;
				if (a[7]==(~b[7])&&a[7]!==result_golden[7])overflow_golden=1;
				else overflow_golden=0;
				#10
				$display("a=%d, b=%d, add=%b, result=%d, overflow=%b",a,b,add,result,overflow );
				if ( result !== result_golden || overflow !== overflow_golden ) begin
					$display ( "Error: golden is %d, %d" , result_golden , overflow_golden ) ;
					$finish ;
				end
				#10
				;
			end
		end
		$display ("PASS!") ;
		$finish ;
	end
	initial begin
        	$fsdbDumpfile ( "add_sub.fsdb" ) ;
	        $fsdbDumpvars ;
	end


endmodule

