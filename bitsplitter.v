module bitsplitter(
	input [7:0]data,
	input clk,
	input ld,
	output even,
	output odd
);
wire outpiso;
wire outtff;
wire held;
PISO sr(data,clk,ld,outpiso);
tffp fdff(clk,ld,outtff);
holdout hol(outtff,clk,outpiso,held);
assign even=held;
assign odd=(outtff)?outpiso:1'b0;
endmodule