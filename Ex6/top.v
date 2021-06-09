//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name: Venice McGauley
// Date: 9th June 2021 
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module converter(input clk, [2:0]colour, ena, output reg [23:0]rgb); 
  
  mybram my_ip(
    .clk(clk) // input wire clk
    .ena(ena) // input wire ena
    .wea(wea) // input wire [0:0] wea
    .addra(addra) // input wire [2:0] addra
    .dina(dina) // input wire [23:0] dina
    .douta(douta) // output wire [23:0] douta
  );
  
endmodule 
