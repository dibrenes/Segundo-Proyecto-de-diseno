`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Derivador
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Derivador #(parameter W = 12)(
    input CLK, Reset, Enable,
    input wire [W-1:0] y,
    output wire [W-1:0] dk
    );

	wire [W-1:0] c1, c2;

	Registro Registro_1 (
    .Reset(Reset), 
    .CLK(CLK), 
    .Enable(Enable), 
    .Entrada(y), 
    .Salida(c1)
    );
	
	Sumador Sumador_1 (
    .Reset(Reset), 
    .C(-c1), 
    .D(y), 
    .Sout(c2)
    );
	
	Multiplicador Multiplicador_1 (
    .Reset(Reset), 
    .A(c2), 
    .B(12'd150), 
    .Mout(dk)
    );
	 
endmodule
