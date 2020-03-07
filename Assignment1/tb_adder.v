`timescale 1ns/1ns
module tb_adder;

parameter N=32;

reg [N-1:0] InA;
reg [N-1:0] InB;

reg clk=0;
wire [N:0]Out;


		always 
		begin
		#1 clk =~clk;
		end

	adder #(N) a1(clk, InA, InB, Out);

initial 
	begin
	InA = 32'h000A_000A;  InB = 32'h0001_0001;
	#2
	InA = 32'hFFFF_FFFF;  InB = 32'hFFFF_FFFF;
	#2
	$stop;
	end
endmodule