`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:22 09/25/2017 
// Design Name: 
// Module Name:    clock_div4 
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
module clock_div4(in,out);
 input in;
 output reg out;
 reg [2:0]count=0;
 always@(negedge in)
 begin
  if(count==4)
  begin
   count<=1; out<=0;
  end
  else if(count>=2)
  begin
   count<=count+1; out<=1;
  end
  else
  begin
   count<=count+1; out<=0;
  end
 end

endmodule
