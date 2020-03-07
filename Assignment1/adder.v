///// 16 bit adder /////

module adder #(parameter N = 16)(clk, InA, InB, Out);

	input [N-1:0] InA;
	input [N-1:0] InB;
	input clk;
	output reg[N:0] Out;
	
 always @(posedge clk)
	begin 
		Out <= InA + InB ;
	end
endmodule