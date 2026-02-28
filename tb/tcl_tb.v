`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2026 20:11:04
// Design Name: 
// Module Name: tcl_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tcl_tb();
reg clk;
reg rst;
reg sen;
wire[1:0]mr;
wire[1:0]sr;
tcl uut(.clk(clk),.rst(rst),.sen(sen),.mr(mr),.sr(sr));
initial begin
clk=0;
forever
#20 clk=~clk;
end
initial begin
rst=1;
sen=0;
#20 rst=0;
#25 sen=1;
end
initial begin
$monitor("time=%d\trst=%b\tsen=%b\t",$time,rst,sen);
end

endmodule
