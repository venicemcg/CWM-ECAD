//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top(input clk_p, clk_n, rst_n, temperature_0, temperature_1, temperature_2, temperature_3, temperature_4, output heating, cooling); 
	
	
	// clock infrastructure
	wire clk_ibufds; 
	
	IBUFDS IBUFDS_sysclk (
		.I(clk_p), 
		.IB(clk_n), 
		.O(clk_ibufds)
	); 
	
	wire clk; // use this signal as a clock for the design 
	
	BUFG bufg_clk(
		.I (clk_ibufds), 
		.O (clk)
	); 
	
	// logic
	wire temp; 
	assign temp = {temperature_4, temperature_3, temperature_2, temperature_1, temperature_0}; 
	ac ac(.clk(clk), .temp(temp), .heat(heating), .cool(cooling)); 
	
endmodule 
