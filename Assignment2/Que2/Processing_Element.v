module Processing_Element (clk, reset, inA, inB, outA, outB, out);

input [7:0] inA, inB;
input clk, reset;
output reg [7:0]outA, outB;
output reg [15:0] out;
reg [15:0] mulAB = 0;

always @ (posedge clk)
begin
if (reset)
	begin
	out <= 0;
	outA <= 0;
	outB <= 0;
	end
  
 else
	begin
	outA<= inA;
	outB <= inB;
	
	mulAB= inA*inB;
	out<= out + mulAB;
	
	end

end



endmodule