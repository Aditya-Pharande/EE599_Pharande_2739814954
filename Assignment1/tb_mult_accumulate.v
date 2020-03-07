`timescale 1ns/1ns

module tb_mult_accumulate;

parameter N=4;
reg  [16*N-1:0]In;
reg clk=0;
wire [15:0]Out;
//wire [16*N-1:0]in_mult;
//wire [16*N-1:0] adder_in;
//wire  [16*N-1:0]outmul1;


	always 
	begin
	#1 clk =~clk;
	end


	mult_accumulate #(N) mac1 (clk, In, Out);
	

initial 
	begin
	In[7:0] = 8'h03;  In[15:8] = 8'h06;
	In[23:16] = 8'hAB;  In[31:24] = 8'h02;
	In[39:32] = 8'h03;  In[47:40] = 8'h06;
	In[55:48] = 8'hAB;  In[63:56] = 8'h02;


	#2
	In[7:0] = 8'hFF;  In[15:8] = 8'hFF;
	In[23:16] =  8'h08; In[31:24] = 8'h05;
	In[39:32] = 8'h03;  In[47:40] = 8'h06;
	In[55:48] = 8'hAB;  In[63:56] = 8'h02;
	#20
	
	$stop;
	end





endmodule
