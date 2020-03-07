module mult_accumulate #(parameter N=32) (clk, In, Out);


input  [16*N-1:0]In;
input clk;
output reg [15:0]Out;
//output reg done =0;
 reg [16*N-1:0]in_mult;
wire [16*N-1:0]out_mult;
wire [16*N-1:0]outmul1;
 reg [16*N-1:0] adder_in;
wire [15:0]adder_out;
   		
	mult_scal #(N) mul1 (clk, In, out_mult);
	adder_tree #(N) tree1(clk, adder_in, adder_out);

assign outmul1 =out_mult;

always @(posedge clk)
begin

in_mult <= In;
adder_in<= out_mult;
Out<= adder_out;

end
endmodule
	