////////////////////////////////////////////////////////////////////////// ////////
// Exercise #4 - Dynamic LED lights
// Student Name: Venice McGauley 
// Date: 8th June 2021 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module LED(
   // Add the inputs and outputs of the function
   input clk, 
   input rst, 
   input button, 
   output [2:0] colour 
   ); 

   // Add the registers and the wires required 
//CHECK TO SEE IF MORE ARE REQUIRED 
   reg colour; 

   // User logic 
   always @(posedge clk) 
   begin 
   // Use a series of else if statements to move through the different lighting cases 
   if (colour==3'b000)
      colour = 3'b001; 
   // No check needs to be done on the value of button since if button = 0 or 1 this is always the case 
   else if (colour==3'b111)
      colour = 3'b001; 
   // This reasoning is the same as above 
   else if (colour==3'b001 && button==1)
      colour = 3'b010; 
   // Step through to next colour
   else if (colour==3'b001 && button==0)
      colour = colour; 
   // No change in value of colour occurs 
   else if (colour==3'b010 && button==1)
      colour = 3'b011; 
   // Step through to next colour 
   else if (colour==3'b010 && button==0)
      colour = colour; 
   // No change in value occurs 
   else if (colour==3'b011 && button==1)
      colour = 3'b100; 
   // Step through to next colour 
   else if (colour==3'b011 && button==0)
      colour = colour; 
   // No change in value occurs 
   else if (colour==3'b100 && button==1)
      colour = 3'b101; 
   // Step through to next colour 
   else if (colour==3'b100 && button==0)
      colour = colour; 
   // No change in value occurs 
   else if (colour==3'b101 && button==1)
      colour = 3'b110; 
   // Step through to next colour 
   else if (colour==3'b101 && button==0)
      colour = colour; 
   // No change in value occurs 
   else if (colour==3'b110 && button==1) 
      colour = 3'b001; 
   // Step through to next colour 
   else if (colour==3'b110 && button==0)
      colour = colour; 
   // No change in value occurs 
   end 

endmodule
