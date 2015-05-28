`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Habilitador de 200Hz
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Divisor_5ms(
    input CLK,
    input Reset,
    output reg Enable
    );

	reg [18:0] Contador;
	
	always @(posedge CLK)
      if(Reset) begin
         Contador <= 19'b0;
			Enable <= 1'b0;
		end
      else begin
         if(Contador == 19'd500000) begin //500 000
				Contador <= 19'b0;
				Enable <= 1'b1	;
			end
			else begin
				Contador <= Contador + 1;
				Enable <= 1'b0;
			end
		end

endmodule
