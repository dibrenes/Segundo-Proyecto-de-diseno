`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Dise�o Digital
// Proyecto de dise�o #2
// Acople de entrada de la referencia
// Diego Brenes Mart�nez
// Francisco Chac�n Cambronero
//////////////////////////////////////////////////////////////////////////////////

module Acople_r #(parameter W = 19)(
    input Reset,
    input [7:0] rIN,
    output reg [W-1:0] rOUT
    );

	always @* begin
		if(Reset)
			rOUT <= 19'b0;
		else
			rOUT <= {{11{rIN[7]}}, rIN};
	end

endmodule
