`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// I_PD
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module I_PD #(parameter W = 12)(
    input CLK, Reset,
    input wire [W-1:0] r,
    input wire [W-1:0] y,
    output wire [W-1:0] I_PD,
	 output wire Listo
    );
	
	wire [W-1:0] c1, c2, c3, c4, c5;
	wire c6;
	
	assign Listo = c6;
	
	Divisor_5ms Divisor_5ms_1 (
    .CLK(CLK), 
    .Reset(Reset), 
    .Enable(c6)
    );
	 
	Sumador Sumador_1 (
    .Reset(Reset), 
    .C(r), 
    .D(y), 
    .Sout(c1)
    );
	 
	Integrador Integrador_1 (
    .Reset(Reset), 
    .CLK(CLK), 
    .Enable(c6), 
    .ek(c1), 
    .ik(c2)
    );
	 
	Proporcional Proporcional_1 (
    .Reset(Reset), 
    .y(y), 
    .pk(c3)
    );
	
	Derivador Derivador_1 (
    .CLK(CLK), 
    .Reset(Reset), 
    .Enable(c6), 
    .y(y), 
    .dk(c4)
    );
	 
	Sumador Sumador_2 (
    .Reset(Reset), 
    .C(c2), 
    .D(-c5), 
    .Sout(I_PD)
    );

	Sumador Sumador_3 (
    .Reset(Reset), 
    .C(c3), 
    .D(c4), 
    .Sout(c5)
    );
	 
endmodule
