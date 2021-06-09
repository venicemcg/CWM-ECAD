// Dynamic LED light file 

`timescale 1ns / 100ps 

module lights(
   // Add the inputs and outputs
   input clk,
   input rst, 
   input button, 
   output reg[2:0]colour
); 
   
   initial begin 
      colour = 3'b001; 
   end
   
   always @(posedge clk)
      begin 
         if ((button == 0 || button == 1 ) && (colour == 3'b111 || colour == 3'b000))
            colour = 3'b001; 
         else if (button == 0)
            colour = colour; 
         else if ((button == 1) && (colour != 3'b111) && (colour != 3'b110))
            colour = colour + 1;
         else
            colour = 3'b001; 
      end
endmodule 
