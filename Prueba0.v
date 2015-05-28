`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:46 05/27/2015
// Design Name:   I_PD
// Module Name:   C:/Users/Francisco/Desktop/Proyectos Xilinx/Proyecto 2/I_PD/Prueba0.v
// Project Name:  I_PD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: I_PD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba0;

	// Inputs
	reg CLK;
	reg Reset;
	reg [11:0] r;
	reg [11:0] y;

	// Outputs
	wire [11:0] I_PD;
	wire Listo;

	// Instantiate the Unit Under Test (UUT)
	I_PD uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.r(r), 
		.y(y), 
		.I_PD(I_PD),
		.Listo(Listo)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		Reset = 0;
		r = 0;
		y = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Reset = 1'b1;
		#100;
		Reset = 1'b0;
		#100;
		y = 12'b1;
		// Add stimulus here

	end
	
	
	integer documento, k;
	reg [11:0] Array_IN [39:0];
		
	initial begin
		documento = $fopen("I_PD_OUT.txt", "w");
		$readmemb ("VectorRampa.txt", Array_IN);
		for (k = 0; k < 40; k = k + 1) begin
			@(posedge CLK)
			r = Array_IN[k];
			@(posedge Listo)
			$fwrite(documento, "%b%\n", I_PD);
		end
		$fclose(documento);
	end

	initial forever #5 CLK = ~CLK;
      
endmodule

