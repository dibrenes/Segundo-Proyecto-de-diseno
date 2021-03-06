`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Dise�o Digital
// Proyecto de dise�o #2
// Multiplicador
// Diego Brenes Mart�nez
// Francisco Chac�n Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Multiplicador #(parameter W = 19)(
    input Reset,
    input wire signed [W-1:0] A,
    input wire signed [W-1:0] B,
    output reg signed [W-1:0] Mout
    );
	
	reg signed [2*W-1:0] R;
	
	always @* begin
		if(Reset) begin
			Mout <= 19'b0;
			R <= 38'b0;
		end
		else begin
			R <= A * B;
			
				  if(R != 38'b0 && R > 38'h000003FFFF && !R[2*W-1])
				Mout <= 19'h3FFFF;
			else if(R != 24'b0 && R < 38'h3FFFFC0000 &&  R[2*W-1])
				Mout <= 19'h40000;
			else
				Mout <= R[W-1:0];
				
		end
	end

endmodule
