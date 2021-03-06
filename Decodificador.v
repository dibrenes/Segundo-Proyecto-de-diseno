`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Decodificador de 8 a 12 bits 
//////////////////////////////////////////////////////////////////////////////////
module Decodificador  
	(
    input [7:0] entrada,
    input reset,
    output reg [11:0] r
	);


 always @* begin
      if (reset)
         r <= 4'b0000;
      else 
         case (entrada)
				8'd247 : r <= 12'd1921;
				8'd240 : r <= 12'd1803;
				8'd232 : r <= 12'd1685;
				8'd225 : r <= 12'd1567;
				8'd218 : r <= 12'd1450;
				8'd210 : r <= 12'd1332;
				8'd203 : r <= 12'd1214;
				8'd196 : r <= 12'd1096;
				8'd188 : r <= 12'd979;
				8'd181 : r <= 12'd861;
				8'd173 : r <= 12'd743;
				8'd166 : r <= 12'd625; 
            8'd159 : r <= 12'd507; 
				8'd151 : r <= 12'd390;
				8'd144 : r <= 12'd272;
				8'd137 : r <= 12'd154;
				8'd129 : r <= 12'd36; //terminan positivos
				8'd122 : r <= 12'd4015; 
            8'd115: r <= 12'd3897;
				8'd107 : r <= 12'd3779; 
            8'd100: r <= 12'd3661;
				8'd92 : r <= 12'd3544; 
            8'd85: r <= 12'd3426;
				8'd78 : r <= 12'd3308; 
            8'd70: r <= 12'd3190;
				8'd63: r <= 12'd3073;
				8'd56 : r <= 12'd2955; 
            8'd48: r <= 12'd2837;
				8'd41 : r <= 12'd2719; 
            8'd34: r <= 12'd2602;
				8'd26 : r <= 12'd2484; 
            8'd19: r <= 12'd2366;
				8'd12 : r <= 12'd2248; 
            default : r <= 8'd0;
         endcase
		end

endmodule


