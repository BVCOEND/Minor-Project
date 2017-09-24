`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:55 09/25/2017 
// Design Name: 
// Module Name:    timer0 
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
module timer0(ps2,ps1,ps0,psa,t0cs,t0se,t0clk,fosc,tmr0,overflow);
 input ps2,ps1,ps0,psa,t0cs,t0se,t0clk,fosc;
 output reg [7:0]tmr0=0;
 output overflow;
 assign overflow = (&tmr0);
 wire w1,w2,w3,w4;
 clock_div4 x1(.in(fosc),.out(w1));
 assign w2 = (t0cs)?(t0se^t0clk):(w1);
 prescalar x2(.ps2(ps2),.ps1(ps1),.ps0(ps0),.in(w2),.out(w3));
 assign w4 = (psa)?(w2):(w3);
 always@(posedge w4)
 begin
  tmr0=tmr0+1;
 end

endmodule
