//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name: Venice McGauley
// Date: 7th June 2021 
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs and outputs here
    input a,
    input b, 
    input sel, 
    output out
    );
    
    //Todo: define registers and wires here
    wire out;

    //Todo: define your logic here   

    // Logic for the output of the multiplexer  
    assign #5 out = (sel==0)?a:b;             
      
endmodule
