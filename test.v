module testbitsplit();
reg [7:0]data;
reg clk;
reg ld;
wire [3:0]Sheve;
wire [3:0]Shodd;

qpskinit Main(data,clk,ld,Sheve,Shodd);
initial begin
    clk<=1'b1;
    forever #5 clk<=~clk;
end 
initial begin
    data<=8'b11111111;
    ld<=1'b0;
    #11;
    ld<=1'b1;
    #40
    ld<=1'b0;
    #100
    data<=8'b00001111;
    #20
    ld<=1'b1;
    #40 ld<=1'b0;
    #200 $stop;    
end
endmodule
