// Dynamic LED light file 

`timescale 1ns / 100ps 

module lights(input rst,clk, button, 
output reg [2:0]colour); 

// user logic
initial begin 
colour = 3'b002; 
end

always @(posedge clk)
begin 
if (rst == 1)
colour = 3'b000; 
  else if (button == 0 && (colour == 3'b111 || colour == 3'b000))
    colour = 3'b001; 
  else if
