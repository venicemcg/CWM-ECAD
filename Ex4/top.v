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
   output reg [2:0] colour 
   ); 

   always @(posedge clk or posedge rst) begin 
    
      if (rst == 1)
         colour <= 'b001;
      else if (colour == 'b000 || colour == 'b111)
         colour <= 'b001; 
      else if (button == 1) begin 
         case (colour)
            1 : colour <= 2;
            2 : colour <= 3; 
            3 : colour <= 4;
            4 : colour <= 5; 
            5 : colour <= 6; 
            6 : colour <= 1; 
            default : colour <= 1;
         endcase:
      end
   end
endmodule
