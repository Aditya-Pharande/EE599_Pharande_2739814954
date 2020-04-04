module mux (clk, reset, in0, in1, s, out);

input [7:0] in0, in1;
input clk, s, reset;
output [7:0]out;
reg [7:0]out1;


always @ (posedge clk)
begin
 if (reset)
  out1 <= 0;
 else
	begin
		if(s)
		out1<= in1;
		else
		out1 <= in0;
	end

end

assign out = out1;
endmodule

