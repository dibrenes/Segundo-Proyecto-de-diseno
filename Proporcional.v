`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Dise�o Digital
// Proyecto de dise�o #2
// Proporcional
// Diego Brenes Mart�nez
// Francisco Chac�n Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Proporcional #(parameter W = 12)(
	 input Reset,
    input wire [W-1:0] y,
    output wire [W-1:0] pk
    );

	Multiplicador Multiplicador_1 (
    .Reset(Reset), 
    .A(y), 
    .B(12'd18), 
    .Mout(pk)
    );

endmodule
