module bitsplitter(
	input [7:0]data,
	input clk,
	input ld,
	output even,
	output odd,
	output [3:0]Sheve,
	output [3:0]Shodd
);
wire outpiso;
wire outtff;
wire held;
PISO sr(data,clk,ld,outpiso);
tffp fdff(clk,ld,outtff);
assign even=outtff?1'b0:outpiso;
assign odd=(outtff)?outpiso:1'b0;
SIPO sr1(even,odd,clk,outtff,ld,Sheve,Shodd);
endmodule
/*
module bitsplitter(
	input [7:0]data,
	input clk,
	input ld,
	output even,
	output odd
);
wire outpiso;
wire outtff;
PISO sr(data,clk,ld,outpiso);
tffp fdff(clk,ld,outtff);
assign even=odd=(outtff)?1'b0:outpiso;
assign odd=(outtff)?outpiso:1'b0;
endmodule
*/
