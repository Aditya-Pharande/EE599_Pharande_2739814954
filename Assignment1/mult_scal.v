module mult_scal #(parameter N = 1) (clk, In, Out);
input  [16*N-1:0]In;
input clk;
output [16*N-1:0]Out;

genvar i;

	generate 
   		for (i = 0; i < 8*2*N; i = i + 16) 
		begin
       		multiply m1 (clk, In[i+7:i], In[i+15:i+8],Out[i+15:i]);
   		end
	endgenerate	
	
endmodule
	