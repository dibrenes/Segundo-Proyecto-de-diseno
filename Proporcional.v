`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Proporcional
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Proporcional #(parameter W = 19)(
	 input Reset,
    input wire [W-1:0] y,
    output wire [W-1:0] pk
    );

	Multiplicador Multiplicador_1 (
    .Reset(Reset), 
    .A(y), 
    .B(19'd18), 
    .Mout(pk)
    );

endmodule
