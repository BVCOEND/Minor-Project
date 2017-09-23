`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 		3ST Technologies 
// Engineer:		Kartik Agarwal
//
// Create Date:   22:10:18 09/23/2017
// Design Name:   Data_Memory_test
// Module Name:   D:/Projects/PIC_RISC/Data_Memory_test.v
// Project Name:  PIC_RISC

// Verilog Test Fixture created by ISE for module: Data_Memory

////////////////////////////////////////////////////////////////
module Data_Memory_test;

reg rd_wr;
reg [7:0] address;
reg [7:0] data_in;
reg clock;
reg reset;

wire [7:0] data_bus;

Data_Memory uut (
	.rd_wr(rd_wr), 
	.address(address), 
	.data_in(data_in), 
	.clock(clock), 
	.reset(reset), 
	.data_bus(data_bus)
);

initial 
begin
	rd_wr = 0;
	address = 0;
	data_in = 0;
	clock = 0;
	reset = 1;
	#5 reset=0;
	#5 reset=1;
end
	
	
task gen_addr;
input d;
output [7:0] address;
begin
	#(d)address=$random;
end
endtask;

task gen_data;
input d;
output [7:0] data_in;
begin
	#(d)data_in=$random;
end
endtask;

always
begin
	gen_addr($random,address);
	gen_data($random,data_in);
	@(posedge clock) rd_wr=$random;
end

always #10 clock=~clock;

always@(posedge clock)
begin
if(rd_wr)
	$display("Data=%0d\t\t\t read from address=%0d\t\t\t at time=%0t",data_bus,address,$time);
else
	$display("Data=%0d\t\t\t write to address=%0d\t\t\t at time=%0t",data_in,address,$time);
end

endmodule
	


