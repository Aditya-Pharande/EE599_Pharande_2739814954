`timescale 1ns/1ps
module tb_systolic_array();

parameter N =16;

parameter clock_cycle = 2;
wire [N*8-1:0]inA,inB;
reg [7:0]inA_array[0:N-1];
reg [7:0]inB_array[0:N-1];
reg clk =0;
reg reset;
wire [(N**2)*16-1:0]out;
wire [15:0]out_array[0:N**2-1];
reg [N*16-1:0]out_reg[N-1:0]; 
reg [15:0] array_out [0:N-1][0:N-1];
reg [7:0]MatA[0:N-1][0:N-1];
reg [7:0]MatB[0:N-1][0:N-1];
reg [15:0]MatOut[0:N-1][0:N-1];
integer i, j,l,m,n;
	
		systolic_array #(N) t1(clk, reset, inA, inB, out);
always 
	begin
	#1 clk =~clk;
	end

genvar x;
generate 
begin
	for (x=0; x<N; x=x+1)begin
	assign inA[8*x+7:8*x]=inA_array[x];
	assign inB[8*x+7:8*x]=inB_array[x];
	end
	
	for (x=0; x<N**2; x=x+1)begin
	assign out_array[x]=out[16*x+15:16*x];
	end
	
	
end
endgenerate






/*always@(*)
begin
for (i=0;i<N;i=i+1)
		begin
		 
	   v1 = out[((i+1)*(N*16)-1): (i*N*16)];
		out_reg[i]=v1;
		end
end*/

/*genvar i,j;
generate
begin
for (i =0; i<N; i=i+1)
begin 
	for(j =0; j<N; j=j+1)
	begin 
	[15:0]array_out[i][j] = 1'b0;
	end
end 
end
endgenerate*/




initial
begin
reset = 1;
#(3*clock_cycle+1); 

reset =0; 

for (i=0;i<N;i=i+1)begin
	for (j=0;j<N;j=j+1)begin
		MatA[i][j]= i*N+j+1;
		MatB[i][j]= N*(i+1)-j; 
	end
end


for(l=0;l<2*N-1; l=l+1)
begin 

	for (i=0;i<N;i=i+1)
	begin
		inA_array[i]=0;
		inB_array[i]=0;
	end
	
	
	if (l<N) 
	begin
		m=0;n=0;
		for (i=0;i<N;i=i+1)
		begin
			for (j=0;j<N;j=j+1)
			begin
				if(i+j == l)
				begin
					inA_array[m]=MatA[i][j];
					m=m+1;
				end
			end
		end
		
		
		
		for (j=0;j<N;j=j+1)
		begin
			for (i=0;i<N;i=i+1)
			begin
				if(i+j == l)
				begin
					inB_array[n]=MatB[i][j];
					n=n+1;
				end
			end
		end
		
	end
	else
	begin
			m=0;n=0;
		for (j=0;j<N;j=j+1)
		begin
			for (i=0;i<N;i=i+1)
			begin
				if(i+j == l)
				begin
						inA_array[N-m-1]=MatA[i][j];
						m=m+1;
				end
			end
		end
		
		for (i=0;i<N;i=i+1)
		begin
			for (j=0;j<N;j=j+1)
			begin
				if(i+j == l)
				begin
						inB_array[N-n-1]=MatB[i][j];
						n=n+1;
				end
			end
		end
	end
	#clock_cycle;
end
	for (i=0;i<N;i=i+1)
	begin
		inA_array[i]=0;
		inB_array[i]=0;
	end
		#((N-1)*clock_cycle);
	
	for (i=0; i<N; i=i+1)
	begin
		for(j=0;j<N;j=j+1)
		begin
		
		MatOut[i][j]=out_array[i*N+j];
		end
	end
	
	
	
#40
$stop;






/*inA[N*8-1:0]= 24'h00_00_01; inB[N*8-1:0]= 24'h00_00_03; 
reset = 1;
#6;
reset =0; 
#2;
inA[N*8-1:0]= 24'h00_04_02; inB[N*8-1:0]= 24'h00_02_06; 
#2;
inA[N*8-1:0]= 24'h07_05_03; inB[N*8-1:0]= 24'h01_05_09; 
#2;
inA[N*8-1:0]= 24'h08_06_00; inB[N*8-1:0]= 24'h04_08_00; 
#2;
inA[N*8-1:0]= 24'h09_00_00; inB[N*8-1:0]= 24'h07_00_00; 
#2;
inA[N*8-1:0]= 24'h00_00_00; inB[N*8-1:0]= 24'h00_00_00; 
#40
$stop;*/

end
endmodule

