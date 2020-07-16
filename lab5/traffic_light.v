module traffic_light( clk, rst_n, g1, y1, r1, g2, y2, r2) ;
input clk, rst_n;
output g1, y1, r1, g2, y2, r2;
reg [3:0] state, nextstate;
reg g1, y1, r1, g2, y2, r2;

always @(posedge clk or negedge rst_n)
	begin
		if (!rst_n) state <= 0;
		else state <= nextstate;
	end

always@(*)begin
		g1 = 0;
		y1 = 0;
		r1 = 0;
		g2 = 0;
		y2 = 0;
		r2 = 0;
		case(state)
		0,1,2:
			begin
			g1 = 1;
			r2 = 1;
			nextstate = state + 1;
			end
		3:
		begin
			y1 = 1;
			r2 = 1;
			nextstate = state + 1;
		end
		4,5,6:
		begin
			r1 = 1;
			g2 = 1;
			nextstate = state + 1;
		end
		7:
		begin
			r1 = 1;
			y2 = 1;
			nextstate = 0;
		end
		default:
				begin
					g1 = 0; 
					y1 = 0; 
					r1 = 0; 
					g2 = 0; 
					y2 = 0; 
					r2 = 0; 
				end 
		endcase
	end


endmodule
