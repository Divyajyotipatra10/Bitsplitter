module TFFp(
    input clk,
    input reset,
    output reg tout
    );
always @(posedge clk or posedge reset)
begin
	if(reset)
	begin
		tout<=0;
	end
	else
	begin
		tout<=~tout;
	end
end
endmodule
