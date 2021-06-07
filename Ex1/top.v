//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 - Electric Roller Blinds
// Student Name:Venice McGauley
// Date: 7th June 2021
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  where the inputs a,b select which roller control signal func to output according to the following
//  Truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0] - Closed
//  0 | 1 | func [1] - Quarter open
//  1 | 0 | func [2] - Half open
//  1 | 1 | func [3] - Fully open
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module blinds(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    
    wire   out;
    assign 
      if (a && b = 0)
         out = func[0];
    assign
      if (a = 0 && b = 1) 
         out = func[1];
    assign
      if (a = 1 && b = 0) 
         out = func[2];
    assign 
      if (a && b = 1) 
         out = func[3];
     

endmodule
