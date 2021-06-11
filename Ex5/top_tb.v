//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Venice McGauley
// Date: 8th June 2021 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb();
  
// Define any parameters
  parameter CLK_PERIOD = 10; 
  
// Define any registers and wires 
 reg clk; 
  reg [2:0]colour; 
  wire ena; 
  wire [23:0]rgb;
  reg err; 
  
  // Clock generation 
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk; 
  end
  
  // trial various 3 bit colours 
  assign enable = 1; 
  initial begin 
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
  
  // Finish test and check for success
  initial begin 
    #50
    if (err == 0)
      $display("TEST PASSED"); 
    $finish; 
    if (errr == 1)
      $display("TEST FAILED"); 
    $finish; 
  end
  
  // Instantiating converter top
  converter top(
    .clk(clk), 
    .colour(colour), 
    .ena(ena), 
    .rgb(rgb)
  ); 
endmodule 
