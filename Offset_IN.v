`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Sumador del offset de entrada
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Offset_IN #(parameter W = 19)(
    input Reset,									//Entrada de reinicio
    input [15:0] Dato_IN,						//Entrada de datos provenientes del ADC (16 bits)
    output reg signed [W-1:0] yOUT,	 		//Salida "yOUT" con el offset en cero (12 bits)
	 output wire [3:0] ProtocoloADC
    );
	
	assign ProtocoloADC = Dato_IN[15:12];
	
	reg [11:0] ymenosoffset;
	
	always @* begin
		if(Reset) begin
			ymenosoffset <= 12'b0;
			yOUT <= 19'b0;
		end
		else begin
			ymenosoffset <= {!Dato_IN[11], Dato_IN[10:0]};
			 yOUT[W-1:8] <= {11{ymenosoffset[11]}};
			   yOUT[7:0] <= ymenosoffset[11:4];
		end
	end

endmodule
