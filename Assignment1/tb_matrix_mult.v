`timescale 1ns/1ns

module tb_matrix_mult;

//4*4 module

parameter N=4;
reg  [16*N-1:0]In;
reg clk=0;
wire [15:0]Out;
//wire [16*N-1:0]in_mult;
//wire [16*N-1:0] adder_in;
//wire [16*N-1:0]outmul1;
reg [N**2-1:0][7:0]in1, in2;
reg [N:0] count=0;
reg done=0;
integer i,j;



	always 
	begin
	#1 clk =~clk;
	end


	mult_accumulate #(N) mac1 (clk, In, Out);
	

always @(posedge clk)
begin
	count <= count+1;
	if ((count > 3) && (count<=N**2+3))
		done =1;
	else
	done =0;
	
		
end
	
	
	initial 
	begin
		for (i=0; i< N**2; i=i+1)
		 begin
			in1[i]= $urandom % 127;
			in2[i]= $urandom % 127;
	  	end

		for (i=0; i<= 2**N-N; i=i+N) begin
	        for (j=0; j< N; j=j+1)begin
	         In[7:0] = in1[i];   
		 In[15:8] = in2[j];
	         In[23:16] = in1[i+1]; 
		 In[31:24] = in2[j+4];
	         In[39:32] = in1[i+2]; 
		 In[47:40] = in2[j+8];
	         In[55:48] = in1[i+3]; 
		 In[63:56] = in2[j+12];
			#2;
		end
			//#2;
		end
        


		#40
		$stop;
		

        end
endmodule 
