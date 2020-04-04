module systolic_array # (parameter N= 32)  (clk, reset, inA, inB, out);
input [N*8-1:0]inA,inB;
input clk, reset;
output [(N**2)*16-1:0]out;

wire [N*8-1:0]stageA[N:0]; 
wire [N*8-1:0]stageB[N:0]; 
wire [N*16-1:0]out_reg[N-1:0]; 


assign stageA[0]=inA;
assign stageB[0]=inB;

genvar i,j;


	generate 
		
		
		for (i=0; i<N; i=i+1)
		begin
		for (j=0; j<N; j=j+1)
		begin
			
			 Processing_Element PE1 (clk, reset, stageA[j][i*8+7:i*8], stageB[i][j*8+7:j*8], stageA[j+1][i*8+7:i*8], stageB[i+1][j*8+7:j*8], out_reg[i][((j+1)*16)-1:j*16]);
		end
		end
		
		for (i=0;i<N;i=i+1)
		begin
		  assign  out[((i+1)*(N*16)-1): (i*N*16)] = out_reg[i];
		end
		
			
	endgenerate




endmodule

