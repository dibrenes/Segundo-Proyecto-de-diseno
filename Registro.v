`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Dise�o Digital
// Proyecto de dise�o #2
// Registro
// Diego Brenes Mart�nez
// Francisco Chac�n Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Registro #(parameter W = 12)(
    input Reset, CLK, Enable,
    input wire [W-1:0] Entrada,
    output reg [W-1:0] Salida
    );
	
	reg [W-1:0] R;
	
	always @(posedge CLK) begin
		if(Reset) begin
			R <= 12'b0;
			Salida <= 12'b0;
		end
		else if(Enable) begin
			R <= Entrada;
			Salida <= R;
		end
		else
			Salida <= R;
	end

endmodule
