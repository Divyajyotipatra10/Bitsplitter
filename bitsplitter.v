module qpskinit(
    input [7:0]data,
    input clk,
    input ld,
    output [3:0] Sheve,
    output [3:0] Shodd
    );
wire outpiso;
wire outtff;
wire even;
wire odd;
PISO sr(data,clk,ld,outpiso);//NRZ L output
TFFp fdff(clk,ld,outtff);//T flip flop for deciding between even or odd bits
assign even=outtff?1'b0:outpiso;//bit splitter
assign odd=(outtff)?outpiso:1'b0;//bit splitter
SIPO sr1(even,odd,clk,outtff,ld,Sheve,Shodd);
endmodule
