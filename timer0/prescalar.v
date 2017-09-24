`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:58 09/24/2017 
// Design Name: 
// Module Name:    prescalar 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module prescalar(ps2,ps1,ps0,in,out);
 input ps2,ps1,ps0,in;
 output reg out;
 reg [8:0]n,count=0;
 always@(negedge in)
 begin
  case({ps2,ps1,ps0})
   3'b000: n=2;
   3'b001: n=4;
   3'b010: n=8;
   3'b011: n=16;
   3'b100: n=32;
   3'b101: n=64;
   3'b110: n=128;
   3'b111: n=256;
  endcase
  if(count==n)
  begin
   count<=1;
	out<=0;
  end
  else if(count>=n/2)
  begin
   out<=1;
	count<=count+1;
  end
  else
  begin
   out<=0;
	count<=count+1;
  end
 end

endmodule
