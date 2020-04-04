`timescale 1ns/1ps
module tb_barrel_shifter;

parameter N = 16;


reg [N*8-1:0]in;
reg [$clog2(N)-1:0]s;
reg reset;
reg clk = 0;
wire [N*8-1:0] out;

	
	
		barrel_shifter # (N) m1 (clk, reset, in, s, out);
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

	in[71:64] = 8'h08;  in[79:72] = 8'h09;
	in[87:80] = 8'h0A;  in[95:88] = 8'h0B;
	in[103:96] = 8'h0C;  in[111:104] = 8'h0D;
	in[119:112] = 8'h0E;  in[127:120] = 8'h0F;



s[$clog2(N)-1:0]=4'h9;


reset = 1;
#6;
reset =0; 
#2;
s[$clog2(N)-1:0]=4'hf;

#40

$stop;

end
endmodule
