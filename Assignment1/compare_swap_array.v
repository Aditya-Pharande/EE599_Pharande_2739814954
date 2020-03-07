module compare_swap_array #(parameter N = 16) ( in, out);
input  [N-1:0][7:0]in;

output  [N-1:0][7:0]out ;

genvar i;

			generate 
   			for (i = 0; i < N-1; i = i + 2) 
				begin
       				compare_swap m1 (.in1(in[i]), .in2(in[i+1]), .out1(out[i]), .out2(out[i+1]));
   				end
			endgenerate	
		
		

	
endmodule
