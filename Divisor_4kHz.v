`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Divisor de frecuencia de 4kHz
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Divisor_4kHz(
    input Reset,
    input CLK,
    output reg CLK4kHz
    );
	
	reg [14:0] Contador;
	
	always @(posedge CLK)
      if(Reset) begin
         Contador <= 15'b0;
			 CLK4kHz <= 1'b0;
		end
      else begin
         if(Contador == 15'd25000) begin //25000
				Contador <= 15'b0;
				 CLK4kHz <= ~CLK4kHz;
			end
			else begin
				Contador <= Contador + 1'b1;
				 CLK4kHz <= CLK4kHz;
			end
		end

endmodule
