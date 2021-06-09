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
  reg [4:0] temp; 
  wire heating;
  wire cooling; 
  reg err = 0; 
  reg up_down = 1; 
  reg [4:0] state_prev; 
  
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk;
  end
  
  initial begin 
    forever begin 
      #CLK_PERIOD
      if (cooling == 1 && heating == 1 ) begin 
        $display("Test failed - cooling and heating can not be both on"); 
        err = 1; 
      end
    end
  end
  
  // Test by cucling temp between 16 and 24
  initial begin 
    temp = 5'b10000; 
    forever begin 
      if (temp <= 5'b10000) 
        up_down = 1; 
      else if (temp >= 5'b11000)
        up_down = 0; 
      else if (up_down == 1) begin 
        #CLK_PERIOD
        temp = temp + 5'b00001; 
      end
      else if (up_down == 0) begin 
        #CLK_PERIOD
        temp = temp - 5'b00001; 
      end
    end
    
    #CLK_PERIOD
    temp = dir ? temp + 5'b00001 : temp - 5'b00001; 
    
    §§§
  end
  
  // Finish test 
  initial begin 
    #200 
    if (err == 0)
      $display("test passed"); 
    $finish; 
  end
  
  ac top(
    .temp(temp), 
    .clk(clk), 
    .heating(heating), 
    .cooling(cooling)
  ); 
  
endmodule 
