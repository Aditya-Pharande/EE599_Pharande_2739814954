`timescale 1ns/1ps
module tb_mux_array;

parameter N = 8;
parameter level = 2;

reg [N*8-1:0]in;
reg s, reset;
reg clk = 0;
wire [N*8-1:0] out;

integer i;

	
	
		mux_array # (N, level) m1 (clk, reset, in, s, out);
always 
	begin
	#1 clk =~clk;
	end

initial
begin

    in[7:0] = 8'h00;  in[15:8] = 8'h01;
	in[23:16] = 8'h02;  in[31:24] = 8'h03;
	in[39:32] = 8'h04;  in[47:40] = 8'h05;
	in[55:48] = 8'h06;  in[63:56] = 8'h07;


s=0;


reset = 1;
#6;
reset =0;

//Checking for worst case 

#2;
s=1;
#2;


$stop;

end
endmodule
