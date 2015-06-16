`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//	Laboratorio de Diseño Digital
// Proyecto de diseño #2
// Sumador del offset de entrada
// Diego Brenes Martínez
// Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module Offset_OUT #(parameter W = 19)(
    input Reset,									//Entrada de reinicio
    input wire [W-1:0] I_PD,			      //Entrada de datos provenientes del I_PD (12 bits)
    output reg signed [7:0] Out8bits		//Salida "Out8bits" con el offset en 1.65V (8 bits)
    );

	reg [W-1:0] i_pdmasoffset;
	
	always @* begin
		if(Reset) begin
			i_pdmasoffset <= 20'b0;
				  Out8bits <= 8'b0;
		end
		else begin
			i_pdmasoffset <= {!I_PD[W-1], I_PD[W-2:0]};
				  Out8bits <= {i_pdmasoffset[W-1:W-8]};
		end
	end

endmodule
