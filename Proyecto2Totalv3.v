`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #1
// Instancia Total
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Proyecto2Totalv3 #(parameter W = 19)(
    input Reset, CLK,
    input DinSerial,
	 input [7:0] rIN,
    output CS,
    output SCLK,
    output pwm,
    output [3:0] ProtocoloADC
    );
	
	wire c1, c6;
	wire [15:0] c2;
	wire [W-1:0] c3, c4, c5, c7, c8;
	wire [7:0] c9;
	
	assign SCLK = c1;
	
	Divisor_4kHz Divisor_4kHz_1 (
    .Reset(Reset), 
    .CLK(CLK), 
    .CLK4kHz(c1)
    );
	
	CapturaADC CapturaADC_1 (
    .Reset(Reset), 
    .CLK4kHz(c1), 
    .DinSerial(DinSerial), 
    .CS(CS), 
    .DoutParalelo(c2)
    );
	
	Offset_IN Offset_IN_1 (
    .Reset(Reset), 
    .Dato_IN(c2), 
    .yOUT(c3), 
    .ProtocoloADC(ProtocoloADC)
    );

	Registro Registro_y (
    .Reset(Reset), 
    .CLK(CLK), 
    .Enable(c6), 
    .Entrada(c3), 
    .Salida(c4)
    );
	
	Acople_r Acople_r_1 (
    .Reset(Reset), 
    .rIN(rIN), 
    .rOUT(c5)
    );
	
	I_PD I_PD_1 (
    .CLK(CLK), 
    .Reset(Reset), 
    .r(c5), 
    .y(c4), 
    .I_PD(c7), 
    .Listo(c6)
    );
	
	Registro Registro_I_PD (
    .Reset(Reset), 
    .CLK(CLK), 
    .Enable(c6), 
    .Entrada(c7), 
    .Salida(c8)
    );
	 
	Offset_OUT Offset_OUT_1 (
    .Reset(Reset), 
    .I_PD(c8), 
    .Out8bits(c9)
    );
	
	PWM PWM_1 (
    .clk(CLK), 
    .I_PD(c9), 
    .pwm(pwm)
    );

endmodule
