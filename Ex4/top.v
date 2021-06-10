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
   // Add the inputs and outputs
   input clk,
   input rst, 
   input button, 
   output reg[2:0]colour
); 
   
   initial begin 
      colour = 3'b001; 
   end
   
   always @(posedge clk)
      begin 
         if ((button == 0 || button == 1 ) && (colour == 3'b111 || colour == 3'b000))
            colour = 3'b001; 
         else if (button == 0)
            colour = colour; 
         else if ((button == 1) && (colour != 3'b111) && (colour != 3'b110))
            colour = colour + 1;
         else if (rst)
            colour <= 3'b001;
         else
            colour = 3'b001; 
      end
endmodule 
