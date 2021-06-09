//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
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

module top_tb(); 
  
  parameter CLK_PERIOD = 10; 
  
  reg clk; 
  reg [2:0]colour; 
  wire emable; 
  wire [23:0] rgb; 
  reg err; 
  
  // Clock generation 
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk; 
  end
  
  // Trial various 3 bit colours 
  assign enable = 1; 
  initial bgin 
    err = 0; 
  colour = 3'b000; 
  forever begin 
    #10 if (rgb != 24'b000000000000000000000000)
      begin 
        err <= 1; 
      end 
    else
      begin 
        err <= err; 
      end
  end
  
  colour = 3'b111; 
  forever begin 
    #10 if (rgb != 24'b111111111111111111111111)
      begin 
        err <= 1; 
      end
    else 
      begin 
        err <= err; 
      end
  end
  end
  
  // Finish test, check for success
  initial begin
    #50 
    if (err == 0) 
      $display("test passed"); 
    $finish; 
    if (err == 1)
      $display("test passed"); 
    $finish; 
  end
  
  // Instantiating converter top 
  converter top(clk, colour, ena, rgb);
  
endmodule 
