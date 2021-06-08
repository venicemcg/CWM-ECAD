//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Venice McGauley 
// Date: 8th June 2021 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/ 100ps 

module ac(input clk, [4:0]temp, 
          output reg heat, reg cool); 
  
// Define any parameters needed
  parameter turnoncool = 22; 
  parameter turnonheat = 18; 
  parameter goaltemp = 20;
  
  always @(posedge clk) begin 
    case ({heat,cool})
      'b01 : begin
        // heat = 0 cool = 1 
        if (temp <= goaltemp) begin 
          cool <= 0; 
          heat <= 0; 
        end 
      end
      'b10 : begin 
        // heat = 1 cool = 0 
        if (temp >= goaltemp) begin 
          cool <= 0; 
          heat <= 0; 
        end
      end
      default : begin 
        if (temp <= turnonheat) begin 
          cool <= 0; 
          heat <= 1; 
        end else if (temp >= turnoncool) begin 
          cool <= 1; 
          heat <= 0; 
        end else begin 
          heat <= 0; 
          cool <= 0; 
        end
      end
    endcase
  end
endmodule 
