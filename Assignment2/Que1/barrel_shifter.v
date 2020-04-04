module barrel_shifter # (parameter N= 16)  (clk, reset, in, s, out);

input clk, reset;
input [$clog2(N)-1:0]s;

input [N*8-1:0]in;

output [N*8-1:0]out;

wire [8*N-1:0]stage[$clog2(N):0]; 
reg [$clog2(N)-1:0]s_stage[$clog2(N):0];

assign stage[0]= in;

genvar i;
integer k;
	generate 
		
   		for (i = 0; i < $clog2(N); i = i + 1) 
		begin
			mux_array # (N, i) m1 (clk, reset, stage[i], s_stage[i][i], stage[i+1]);
			
			
			
   		end 
	endgenerate	


assign out = stage[$clog2(N)];


		always @ (posedge clk)
			begin
			s_stage[0] = s;
			for (k = 0; k < $clog2(N); k = k + 1) 
			s_stage[k+1]<= s_stage[k];
			end



endmodule


