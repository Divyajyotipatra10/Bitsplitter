module holdout(
	input tffout,
	input clk,
	input outpiso,
	output reg hol
);
always @(posedge clk)
begin
	if(tffout) hol<=hol;
	else hol<=outpiso;
end
endmodule