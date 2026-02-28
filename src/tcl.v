`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2026 19:31:37
// Design Name: 
// Module Name: tcl
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

module tcl(
input clk,rst,sen,
output reg[1:0]mr,sr
    );
parameter g=2'd0;
parameter y=2'd1;
parameter r=2'd2;

parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
parameter ty=5,t=10;
 reg[1:0]s;
 reg[3:0]count;
 always@(posedge clk or posedge rst)
 begin
    if(rst)
    begin
    s<=s0;
    count=0;
    end
    else
    case(s)
    s0:if(sen)
    s=s1;
    else
    s=s0;
    s1:if(count<ty&&sen==1)
    begin
    s=s1;
    count=count+1;
    end
    else
    begin
    s=s2;
    count<=0;
    end
    s2:if(count<t)
    begin
    s=s2;
    count=count+1;
    end
    else
    begin
    s=s3;
    count<=0;
    end
    s3:if (count<ty)
    begin
    s=s3;
    count=count+1;
    end
    else
    begin
    s=s0;
    count<=0;
    end
    default:s=s0;
    endcase
    end
 always@(s)
 begin
 case(s)
 s0:begin
 mr=g;
 sr=r;
 end
 s1:begin
 mr=y;
 sr=r;
 end
 s2:begin
 mr=r;
 sr=g;
 end
 s3:begin
 mr=r;
 sr=y;
 end
 endcase
 end  
endmodule
////////TEST BENCH///////////
