`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Sumador
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Sumador #(parameter W = 12)(
    input Reset,
    input wire signed [W-1:0] C,
    input wire signed [W-1:0] D,
    output reg signed [W-1:0] Sout
    );
	
	reg signed [W:0] R;
	
	always @* begin
		if(Reset) begin
			Sout <= 12'b0;
			R <= 12'b0;
		end
		else begin
			R <= C + D;
			
				  if(R != 12'b0 && R > 13'h07FF && !R[W])
				Sout <= 12'h7FF;
			else if(R != 12'b0 && R < 13'h1800 &&  R[W])
				Sout <= 12'h800;
			else
				Sout <= R[W-1:0];
				
		end
	end

endmodule
