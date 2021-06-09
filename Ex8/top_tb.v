//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Venice McGauley
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb(); 
  
  parameter CLK_PERIOD = 10; 
  
  reg clk_p; 
  reg clk_n; 
  reg rst_n; 
  wire heating; 
  wire cooling; 
  reg err; 
  wire [4:0] temp;
  wire (temperature_0, temperature_1, temperature_2, temperature_3, temperature_4); 
  assign temp = {temperature_4, temperature_3, temperature_2, temperature_1, temperature_0}; 
  
  // clock generation 
  initial begin 
    clk_n = 1'b0; 
    clk_p = 1'b0; 
    forever 
      #(CLK_PERIOD/2) clk_p=~clk_p; 
  end
  // start at temp = 0
  assign temperature_0 = 0; 
  assign temperature_1 = 0; 
  assign temperature_2 = 0; 
  assign temperature_3 = 0; 
  assign temperature_4 = 0; 
  // heat = 0 
  // cool = 0 
  forever begin 
    #10 if ((heating == 1 && temp > 20) || (cooling == 1 && temp < 20) || (heating == 1 && cooling == 1))
      begin err = 1; 
      end 
    else
      begin err = 0; 
      end 
  end
  
  // traial response to high initial temp 
  assign temperature_0 = 1; 
  assign temperature_1 = 1; 
  assign temperature_2 = 1; 
  assign temperature_3 = 1; 
  assign temperature_4 = 1; 
  forever begin 
    #10 if ((heating == 1 && temp > 20) || (cooling == 1 && temp < 20) || (heating == 1 && cooling ==1))
      begin err = 1; 
      end 
    else 
      begin err = 0; 
      end 
  end
  
  // repeating but start at mid temp (20) 
  assign temperature_0 = 0; 
  assign temperature_1 = 0; 
  assign temperature_2 = 1; 
  assign temperature_3 = 0; 
  assign temperature_4 = 1; 
  forever begin 
    #10 if ((heating == 1 && temp > 20) || (cooling == 1 && temp < 20) || (heating == 1 && cooling == 1))
      begin err = 1; 
      end 
    else
      begin err = 0; 
      end
  end
  
  // finish test, check for success
  initial begin 
    #50 
    if (err == 0)
      $display("test passed"); 
    $finish; 
    if (err == 1)
      $display("test failed"); 
    $finish; 
  end
  
  //instantiating top
  top top(clk_p, clk_n, rst_n, temperature_0, temperature_1, temperature_2, temperature_3, temperature_4, heating, cooling);
  
endmodule
