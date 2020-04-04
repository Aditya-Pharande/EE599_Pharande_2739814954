module mux_array # (parameter N= 8, parameter level = 0)  (clk, reset, in, s, out);
input [N*8-1:0]in;
input clk, s, reset;
output [N*8-1:0]out;


genvar i;

	generate 
   		/*for (i = 0; i < N; i = i + 1) 
		begin
			mux a1 (clk, reset, in[i], in[((2**level)+i)%N], s, out[i]);
   		end*/ 
		
		for (i = 0; i < 8*N; i = i + 8) 
		begin
       		mux m1 (clk, reset, in[i+7:i], in[(((2**level)+(i/8))%N)*8+7:(((2**level)+(i/8))%N)*8],s, out[i+7:i]);
   		end
		
		
	endgenerate	

endmodule

