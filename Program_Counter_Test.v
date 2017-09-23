`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 3ST Technologies
// Engineer: Kartik Agarwal
//
// Create Date:   19:29:03 09/23/2017
// Design Name:   Program_Counter
// Module Name:   D:/Projects/PIC_RISC/Program_Counter_Test.v
// Project Name:  PIC_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
////////////////////////////////////////////////////////////////////////////////

module Program_Counter_Test;

	// Inputs
	reg clock;
	reg reset;
	reg clear;
	reg jump_enable;
	reg update_pc;
	reg [13:0] jump_addr;

	// Outputs
	wire [13:0] PC;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.clock(clock), 
		.reset(reset), 
		.clear(clear), 
		.jump_enable(jump_enable), 
		.update_pc(update_pc), 
		.jump_addr(jump_addr), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		clear = 0;
		jump_enable = 0;
		update_pc = 0;
		jump_addr = 0;
	end
	
	initial fork
	#5 reset=1'b0;
	#10 reset=1'b1;
		 update_pc=1'b1;
	#100 jump_addr=14'd12765;
	#500 jump_enable=1'b1;
	#550 jump_enable=1'b0;
	#600 update_pc=1'b0;
	#650 clear=1'b1;
	join
	
always #10 clock=~clock;     
endmodule

