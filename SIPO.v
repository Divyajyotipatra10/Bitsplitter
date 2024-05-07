module SIPO(
	input even,
	input odd,
	input clk,
	input tffout,
	input reset,
	output reg [3:0]Sheve,
	output reg [3:0]Shodd
);
reg [1:0]counteve=2'b00;
reg [1:0]countodd=2'b00;
always @(posedge clk)
begin
	if (reset)
	begin
		counteve<=2'b00;
		countodd<=2'b00;
		Sheve<=4'b0000;
		Shodd<=4'b0000;
	end
	else
	begin
		if(tffout)
		begin
			if(counteve==3) Sheve=Sheve;//hold state
			else
			begin
				Sheve[3]=odd;
				Sheve=Sheve>>1'b1;
				counteve=counteve+1'b1;
			end
		end
		else if(!tffout)
		begin
			if(countodd==3) Shodd=Shodd;//hold values till new values arrive
			else
			begin
				Shodd[3]=even;
				Shodd=Shodd>>1'b1;
				countodd=countodd+1'b1;
			end
		end
	end
end
endmodule