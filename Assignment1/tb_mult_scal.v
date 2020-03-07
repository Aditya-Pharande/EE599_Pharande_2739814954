`timescale 1ns/1ns

module tb_mult_scal;

parameter N=2;


reg  [16*N-1:0]In;

reg clk=0;
wire [16*N-1:0]Out;
	always 
	begin
	#1 clk =~clk;
	end

	mult_scal #(N) mult1 (clk, In, Out);

initial 
	begin
	In[7:0] = 8'h03;  In[15:8] = 8'h06;
	In[23:16] = 8'hAB;  In[31:24] = 8'h02;
	#2
	In[7:0] = 8'hFF;  In[15:8] = 8'hFF;
	In[23:16] =  8'h08; In[31:24] = 8'h05;
	#2
	
	$stop;
	end
endmodule
