module odd_even #(parameter N=128) (clk, in, out, done);
input  [N-1:0][7:0]in;
output reg done=0;
input clk;
output reg [N-1:0][7:0] out ;

wire [N-1:0][7:0] in1, out1;
reg [N-1:0][7:0] in11;
reg [N-1:0][7:0] out11;
reg [$clog2(N):0] count=0;
integer i,j,k;




compare_swap_array #(N) m2 (.in(in1), .out(out1));

assign in1 = in11;



always @ (posedge clk)
	begin
		out11= out1;
		if(count== N)
		begin
		done = 1'b1;
		end
		else
		begin
		done = 1'b0;
		end

	if (count == N+1)
		begin
		count<=0;
		
		end
	else
	begin
	if (count == 0)
		begin
			in11 = in;
			count <= count+1;
			out <=out1;
			done = 1'b0;
		end
	 else 
			begin 
			if(count[0]==0)
			    begin

					for (j=1; j< N-1; j=j+1)
					begin
					in11[j]= out1[j-1];
					end
					in11[0]=out[0];
					in11[N-1]=out[N-1];
					
				for (i=0; i< N-2; i=i+1)
					begin
					out[i+1]<= out1[i];
					end

				count <= count+1;
				end
			
		 	else
				begin
					for (k=0; k< N-2; k=k+1)
					begin
					in11[k]= out1[k+1];
					end
					
					
					count<= count + 1;
					out<= out1;
				end
			end

	end
end


endmodule