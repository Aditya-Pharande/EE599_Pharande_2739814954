///// 8 bit Multiplyer Module /////

module multiply(clk, InA, InB, Out);

	input [7:0] InA;
	input [7:0] InB;
	input clk;
	output reg [15:0] Out;
	
 always @(posedge clk)
	begin 
		Out <= InA * InB ;
	end

endmodule