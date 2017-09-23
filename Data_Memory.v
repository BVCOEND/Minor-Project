`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		3ST Technologies
// Engineer: 		Kartik Agarwal
// Create Date:    	19:13:49 09/23/2017 
// Module Name:    	Program_Counter 
// Project Name:   	RISC_8-bit
// Target Devices: 	Xilinx Spartan XC3S100e-5cp132
// Tool versions:  	Xilinx ISE Design suite 14.7 Webpack version
// Description: 	256 Bytes of RAM (Data Memory)

//////////////////////////////////////////////////////////////////////////////////
module Data_Memory(
    input rd_wr,
    input [address_width-1:0] address,
    input [memory_width-1:0] data_in,
    input clock,
    input reset,
    output reg [memory_width-1:0] data_bus
    );

parameter memory_width=8;			//  MEMORY : 256 X 8 bits
parameter memory_size=256;			//	 256 Rows and 8 Columns
parameter address_width=8;

reg [memory_width-1:0] memory [memory_size-1:0];

task reset_memory;
integer i;
for(i=0 ; i<memory_size ; i=i+1)
memory[i]<=0;
endtask

task read_memory;
data_bus<=memory[address];
endtask

task write_memory;
memory[address]<=data_in;
endtask

always@(posedge clock,negedge reset)
begin

	if(!reset)
	begin
		reset_memory();
		data_bus<=0;
	end
	
	else if(rd_wr)			// rd_wr=1  =>  read operation 
		read_memory();
		
	else if(!rd_wr)		// rd_wr=0  =>  write operation
		write_memory();
		
end
		
endmodule
