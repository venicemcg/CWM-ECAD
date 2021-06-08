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
  
  parameter CLK_PERIOD = 10; 
  
  reg [2:0] STOP_AT = 4; 
  
  parameter STOP_AT_4 = 1; 
  parameter STOP_AT_3 = 2; 
  parameter DONT_STOP = 3; 
  
  reg clk; 
  reg rst; 
  reg button; 
  wire [2:0] colour; 
  reg [2:0] colourPrevState; 
  reg [2:0] testPhase; 
  reg err; 
  
  initial begin 
    rst = 1; 
    err = 0; 
    button - 1; 
    testPhase = STOP_AT_4; 
    colourPrevState = 0; 
    
    #50 
    if (colour != 'b001) begin 
      err = 1; 
      $display("***TEST FAILED***"); 
    end 
    rst = 0; 
    #50 
    if (colour == 'b001) begin 
      err = 1; 
      $display("***TEST FAILED***"); 
    end 
  end 
  
  always @(posedge clk) begin 
    if (colour == 'b111 || colour == 'b000) begin 
      err = 1; 
      $display("***TEST FAILED***"); 
    end 
    
    if (colour == STOP_AT) begin 
      button = 0; 
      #70
      if (colour != STOP_AT ) begin 
        err = 1; 
        $display("***TEST FAILED***"); 
      end 
      button = 1; 
      #70
      if (colour == STOP_AT) begin 
        err = 1; 
        $display("***TEST FAILED***"); 
      end 
      
      if (testPhase == STOP_AT_4) begin 
        STOP_AT = 3; 
        testPhase = STOP_AT_3; 
      end else if (testPhase == STOP_AT_3) begin 
        STOP_AT = 0; 
        testPhase = DONT_STOP; 
        
        #100 
        rst = 1; 
        #5
        if (colour != 1) begin 
          err = 1; 
          $display("***TEST FAILED***");
        end 
        #70
        if (colour != 1) begin 
          err = 1; 
          $display("***TEST FAILED***"); 
        end 
        rst = 0; 
        #30 
        if (colour == 1) begin 
          err = 1; 
          $display("***TEST FAILED***"); 
        end
      end
    end
  end
  
  always @(posedge clk) begin 
    if (button == 1 && rst = 0 && testPhase != DONT_STOP) begin 
      if (~(colour == colourPrevState + 1 || (colour == 1 && colourPrevState == 6))) begin 
        err = 1; 
        $display("***TEST FAILED***"); 
      end
      colourPrevState = colour; 
    end 
  end 
  
  initial begin 
    #1000
    if (testPhase != DONT_STOP)
      $display("***TEST FAILED***");
    else if (err == 0) 
      $display("***TEST PASSED***"); 
    $finish; 
  end 
  
  LED top(
    .clk(clk), 
    .rst(rst), 
    .button(button), 
    .colour(colour)
  ); 
  
endmodule 
