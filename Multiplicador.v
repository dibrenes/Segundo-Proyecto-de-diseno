`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Multiplicador
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Multiplicador #(parameter W = 12)(
    input Reset,
    input wire signed [W-1:0] A,
    input wire signed [W-1:0] B,
    output reg signed [W-1:0] Mout
    );
	
	reg signed [2*W-1:0] R;
	
	always @* begin
		if(Reset) begin
			Mout <= 12'b0;
			R <= 12'b0;
		end
		else begin
			R <= A * B;
			
				  if(R != 24'b0 && R > 24'h0007FF && !R[2*W-1])
				Mout <= 12'h7FF;
			else if(R != 24'b0 && R < 24'hFFF800 &&  R[2*W-1])
				Mout <= 12'h800;
			else
				Mout <= R[W-1:0];
				
		end
	end

endmodule
