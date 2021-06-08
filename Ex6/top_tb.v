//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Venice McGauley 
// Date: 8th June 2021 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb(); 
  
  // Define any parameters
  parameter CLK_PERIOD = 10; 
  
  // Define all neccessary registers and wires
  reg clka; 
  reg [2:0]colour; 
  wire ena;
  wire [23:0]rgb; 
  reg err; 
  
  // Generate a clock 
  initial begin 
    clka = 1'b0; 
    forever
      #(CLK_PERIOD/2) clka=~clka; 
  end 
  
  // Trial varaious 3 bit colours 
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
  
  // Finish the test and check for success
  initial begin 
    #50 
    if (err == 0)
      $display("***TEST PASSED***"); 
    $finish; 
    if (err == 1) 
      $display("***TEST FAILED***"); 
    $finish; 
  end
  
  // Instantiating the converter top:
  converter top(clka, colour, ena, rgb); 
  
endmodule 
