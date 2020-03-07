`timescale 1ns/1ps
module tb_odd_even;

parameter N = 16;
reg [N-1:0][7:0]in;
reg clk = 0;
wire  done;
wire [N-1:0][7:0] out;

integer i;

	odd_even #(N) m1 (.clk(clk), .in(in), .out(out), .done(done));

always 
	begin
	#1 clk =~clk;
	end

initial
begin

//Checking for worst case 
for(i=0; i<N; i=i+1)
begin
in[i]= N-i;
end

#200;

$stop;

end
endmodule
