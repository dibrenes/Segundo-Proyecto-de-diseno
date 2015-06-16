`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Sumador
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Sumador #(parameter W = 19)(
    input Reset,
    input wire signed [W-1:0] C,
    input wire signed [W-1:0] D,
    output reg signed [W-1:0] Sout
    );
	
	reg signed [W:0] R;
	
	always @* begin
		if(Reset) begin
			Sout <= 19'b0;
			R <= 20'b0;
		end
		else begin
			R <= C + D;
			
				  if(R != 20'b0 && R > 20'h3FFFF && !R[W])
				Sout <= 19'h3FFFF;
			else if(R != 20'b0 && R < 20'hC0000 &&  R[W])
				Sout <= 19'h40000;
			else
				Sout <= R[W-1:0];
				
		end
	end

endmodule
