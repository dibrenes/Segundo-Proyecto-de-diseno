`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Dise�o Digital
// Proyecto de dise�o #2
// Integrador
// Diego Brenes Mart�nez
// Francisco Chac�n Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Integrador #(parameter W = 19)(
    input Reset, CLK, Enable,
    input wire [W-1:0] ek,
    output wire [W-1:0] ik
    );

	wire [W-1:0] c1, c2, c3;

	Multiplicador Multiplicador_1 (
    .Reset(Reset), 
    .A(ek), 
    .B(19'd7), 
    .Mout(c1)
    );
	 
	Sumador Sumador_1 (
    .Reset(Reset), 
    .C(c1), 
    .D(c3), 
    .Sout(c2)
    );
	 
	Registro Registro_1 (
    .Reset(Reset), 
    .CLK(CLK), 
    .Enable(Enable), 
    .Entrada(c2), 
    .Salida(c3)
    );
	 
	assign ik = c2;

endmodule
