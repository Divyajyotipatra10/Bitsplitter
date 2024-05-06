module tffp(
	input clk,
	input reset,
	output reg tout
);
initial begin
	tout=1'b0;
end
always @(posedge clk)
begin
	tout<=(reset)?1'b0:(~tout);
end
endmodule