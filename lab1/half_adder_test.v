module half_adder_test ; 
	reg x , y ;
	reg [5:0]err_cnt ;
	wire s , c ;
	half_adder M1 ( .x(x) , .y(y) , .s(s) , .c(c) ) ;
	initial begin
		err_cnt = 0 ;
		#100
		x = 0 ;
		y = 0 ;
		#1
		if ( c !== 0 || s !== 0 ) err_cnt = err_cnt + 1 ;
		#100
		x = 1 ;
		y = 0 ;
		#1
		if ( c !== 0 || s !== 1 ) err_cnt = err_cnt + 1 ;
		#100
		x = 0 ;
		y = 1 ;
		#1
		if ( c !== 0 || s !== 1 ) err_cnt = err_cnt + 1 ;
		#100
		x = 1 ;
		y = 1 ;
		#1
		if ( c !== 1 || s !== 0 ) err_cnt = err_cnt + 1 ;
		#100
		if ( err_cnt == 0 ) $display ("PASS!") ;
		else $display("ERROR!") ;
		$finish;
	end
	initial begin
		$monitor ( "x = %b, y = %b, c = %b, s = %b" , x , y , c , s ) ;
	end
	initial begin
		$fsdbDumpfile ( "half_adder.fsdb" ) ;
		$fsdbDumpvars ;
	end

endmodule
