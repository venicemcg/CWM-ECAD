//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Venice McGauley 
// Date: 8th June 2021 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(); 
  
 // Parameters
  parameter CLK_PERIOD = 10; 
  
  // Registers and wires
  reg clk; 
  reg button; 
  reg rst; 
  reg err; 
  reg [2:0] localcolour; 
  wire [2:0] colour; 
  
  // Clock generation 
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk; 
  end
  
  //User logic 
  
  initial begin 
    rst = 1; 
    button = 0; 
    err = 0; 
    localcolour = 3'b000; 
    
    // Checking reset
    #(CLK_PERIOD)
    if (colour != 0) begin 
      $display("Test failed"); 
      err = 1; 
    end
    #(CLK_PERIOD)
    rst = 0; 
    #(CLK_PERIOD) // button = 0 or 1 should make 000 go to 001 
    
    if (colour != 3'b001) begin 
      $display("Test failed"); 
      err = 1; 
    end
    
    forever begin 
      button = 1; 
      if (colour != 6 && colour != 7) begin 
        localcolour = colour; 
        #(CLK_PERIOD)
        if (colour != localcolour + 1) begin 
          $display("test failed");
          err = 1; 
        end
      end
      else if (colour == 6) begin 
        localcolour = colour; 
        #(CLK_PERIOD)
        if (colour != 3'b001) begin 
          $display("test failed"); 
        end
      end
      
      localcolour = colour; 
      button = 0; 
      
      #(CLK_PERIOD)
      if (colour != localcolour) begin 
        $display("test failed"); 
        err = 1; 
      end
    end
  end
  
  // Finish test, check for success
  
  initial begin 
    if (err == 1) begin
      $display("test failed"); 
    end
  end
  initial begin 
    if (err == 0) begin 
      $display("test passed"); 
    end
  end
  
  // Instantiate  module 
  LED top (
    .rst(rst), 
    .button(button), 
    .clk(clk), 
    .colour(colour)
  ); 
  
endmodule 
