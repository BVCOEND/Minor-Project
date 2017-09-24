`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:02 09/24/2017
// Design Name:   prescalar
// Module Name:   C:/Users/RISHABH/pic/prescalar_test.v
// Project Name:  pic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prescalar
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prescalar_test;

	// Inputs
	reg ps2;
	reg ps1;
	reg ps0;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	prescalar uut ( 
		.ps2(ps2), 
		.ps1(ps1), 
		.ps0(ps0), 
		.in(in), 
		.out(out)
	);

	initial
	begin
		ps2 = 1;
		ps1 = 1;
		ps0 = 1;
		in = 0;
	end
	always #5 in=~in;
      
endmodule

