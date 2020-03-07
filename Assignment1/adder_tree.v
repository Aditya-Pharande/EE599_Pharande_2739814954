module adder_tree #(parameter N=2)(clk, in, out);
input [16*N-1:0]in;
input clk;
output [15:0] out;
wire  [16*N-1:0]stage[$clog2(N):0];
genvar i;
 
assign stage[0] = in;
assign out = stage[$clog2(N)][15:0];

	
		generate 
   			for (i = 0; i < $clog2(N); i = i+1) 
			begin
				array_adder #(N/(2**(i))) array1(clk, stage[i][16*N/(i+1)-1:0], stage[i+1][8*N/(i+1)-1:0]);
   			end 	
		endgenerate	


endmodule
