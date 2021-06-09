`timescale 1ns / 100ps

module converter(input clk, [2:0] colour, ena, output reg [23:0] rgb); 
  
  mybram my_ip(
    .clk(clk) 
    .ena(ena), 
    .wea(wea), 
    .addra(addra), 
    .dina(dina), 
    .douta(douta)
  ); 
  
endmodule 
