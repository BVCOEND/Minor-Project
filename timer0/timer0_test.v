`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:47:13 09/25/2017
// Design Name:   timer0
// Module Name:   C:/Users/RISHABH/pic/timer0_test.v
// Project Name:  pic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timer0_test;

	// Inputs
	reg ps2;
	reg ps1;
	reg ps0;
	reg psa;
	reg t0cs;
	reg t0se;
	reg t0clk;
	reg fosc;

	// Outputs
	wire [7:0] tmr0;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	timer0 uut (
		.ps2(ps2), 
		.ps1(ps1), 
		.ps0(ps0), 
		.psa(psa), 
		.t0cs(t0cs), 
		.t0se(t0se), 
		.t0clk(t0clk), 
		.fosc(fosc), 
		.tmr0(tmr0), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		ps2 = 0;
		ps1 = 1;
		ps0 = 0;
		psa = 0;
		t0cs = 0;
		t0se = 0;
		t0clk = 0;
		fosc = 0;
	end
	always #25 fosc=~fosc;
      
endmodule

