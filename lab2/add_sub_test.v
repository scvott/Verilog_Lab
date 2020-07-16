module add_sub_test ;
    reg signed  [7:0] a , b ;
    reg [7:0] err_cnt;
    reg add ;
    wire signed  [7:0] result ;

    add_sub M0 ( .add(add), .a(a), .b(b), .result(result) );
    initial begin
        err_cnt=0;
        a = -8 ;
        b =  6;
        add = 1 ;
        #100
        $display ( "a=%d , b=%d, add=%b ==> result=%d", a, b, add, result ) ;
        #1
        if (result!=-2) err_cnt=err_cnt+1;
        a = -4 ;
        b = -4 ;
        add = 1 ;
        #100
        $display ( "a=%d , b=%d, add=%b ==> result=%d", a, b, add, result ) ;
        #1
        if (result!=-8) err_cnt=err_cnt+1;
        a = 5 ;
        b = 2 ;
        add = 1 ;
        #100
        $display ( "a=%d , b=%d, add=%b ==> result=%d", a, b, add, result) ;
        #1
        if (result!=7) err_cnt=err_cnt+1;
        a = 30 ;
        b = 60 ;
        add = 0 ;
        #100
        $display ( "a=%d , b=%d, add=%b ==> result=%d", a, b, add, result ) ;
        #1
        if (result!=-30) err_cnt=err_cnt+1;
        #100
        if ( err_cnt == 0 ) $display ("PASS!") ;
        else $display("ERROR!") ;

        $finish ;
    end

    initial begin
        $fsdbDumpfile ( "add_sub.fsdb" ) ;
        $fsdbDumpvars ;
    end

endmodule
