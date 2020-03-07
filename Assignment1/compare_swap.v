module compare_swap (in1,in2, out1, out2);
input [7:0]in1, in2;
output reg  [7:0]out1, out2;

always @(*)
begin
	if (in2 < in1)
		begin
			out2=in1;
			out1= in2;
		end
	else	
		begin
		out1 = in1;
		out2 = in2;
		end
end

endmodule

