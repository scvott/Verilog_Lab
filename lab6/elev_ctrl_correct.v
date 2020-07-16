module elev_ctrl ( clk , rst_n, floor , target );
input clk, rst_n;
input [3:0] target;
output  reg [3:0]floor;
reg [3:0]next_floor;

always @(posedge clk or negedge rst_n)begin
	if (!rst_n) begin 
		floor <= 0;
	end else begin
		floor<=next_floor;
	end
end

always@(*)begin	
	if (target > floor)begin
		next_floor = floor+1;
	end else if(target == floor)begin		
		next_floor = floor;
	end else begin	
		next_floor = floor-1;
	end
end


endmodule
