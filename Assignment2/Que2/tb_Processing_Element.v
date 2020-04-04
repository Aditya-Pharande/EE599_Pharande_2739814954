`timescale 1ns/1ps
module tb_Processing_Element;



reg [7:0] inA, inB;
reg clk =0;
reg reset;
wire [7:0]outA, outB;
wire [15:0] out;

	
	
		Processing_Element PE1(clk, reset, inA, inB, outA, outB, out);
always 
	begin
	#1 clk =~clk;
	end

initial
begin




inA= 8'h01; inB= 8'h03; 
reset = 1;
#6;
reset =0; 
#2;
inA= 8'h02; inB= 8'h02; 
#2;
inA= 8'h03; inB= 8'h01; 
#40
$stop;

end
endmodule

