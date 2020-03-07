`timescale 1ns/1ns

module tb_adder_tree;

parameter N=16;
reg [16*N-1:0] in;
reg clk=0;
wire [15:0] out;


	always 
	begin
	#1 clk =~clk;
	end

	   adder_tree #(N) tree_1(clk, in, out);

/*
	initial 
		begin
		file_pointer = $fopen("traffic.out");
		for (i = 0; i < 16*N; i = i + 32) 
		begin
			$fmonitor(file_pointer,"In1=%b\tIn2=%b\tOut=%b\tt",in[i+15:i],in[i+31:i+16],out[((i+32)/2)-1:((i+32)/2)-16]);
  		end 
		end*/

initial 
begin
	
		 in[15:0] = 16'h0002;
		in[31:16] = 16'h0008;
		in[47:32] = 16'hA020;
		in[63:48] = 16'h1070;
		 in[79:64] = 16'h0002;
		in[95:80] = 16'h0008;
		in[111:96] = 16'hA020;
		in[127:112] = 16'h1070;

		 in[143:128] = 16'h0002;
		in[159:144] = 16'h0008;
		in[175:160] = 16'hA020;
		in[191:176] = 16'h1070;
		 in[207:192] = 16'h0002;
		in[223:208] = 16'h0008;
		in[239:224] = 16'hA020;
		in[255:240] = 16'h1070;
		
		
	#20

	$stop;
	end
endmodule
