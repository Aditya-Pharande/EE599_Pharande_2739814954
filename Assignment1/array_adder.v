module array_adder #(parameter N=2)(clk, in, out);

input [16*N-1:0] in;
input clk;
output  [8*N-1:0] out;

genvar i;

	generate 
   		for (i = 0; i < 16*N; i = i + 32) 
		begin
			adder #(16) a1 (clk, in[i+15:i], in[i+31:i+16], out[((i+32)/2)-1:((i+32)/2)-16]);
   		end 
	endgenerate	

endmodule
