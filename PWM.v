`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module PWM
#(parameter TP=8, N_bit=14, sd=40) //El ancho de bits
(
input clk,
input [TP-1:0]I_PD,
//output salida_contador,
output pwm
  );
   
reg pwm_aux;
reg [N_bit-1:0] contador=0;

always @(posedge clk) 
	begin
		contador = contador+1;
		
		if (contador <= I_PD*sd) 
			pwm_aux = 1; 
		else
			pwm_aux = 0;
		 
		if(contador >=  10000)
		   contador = 0;
	
	end


assign pwm = pwm_aux;
//assign salida_contador = contador;
endmodule

  
