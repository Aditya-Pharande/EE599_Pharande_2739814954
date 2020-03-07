`timescale 1ns/1ns

module tb_multiply;

reg [7:0] InA =8'b 0000_0000;
reg [7:0] InB =8'b 0000_0000;

reg clk=0;
wire [15:0]Out;

	always 
		begin
		#1 clk =~clk;
		end

	multiply m1(clk, InA, InB, Out);

initial 
	begin
	InA = 8'b 0000_0001;  InB = 8'b 0000_1111;
	#2
	InA = 8'b 0000_0010; InB = 8'b 0000_0011;
	#2
	InA = 8'b 1111_1111; InB = 8'b 1111_1111;
	#2

	$stop;
	end
endmodule