module mux_tb;

reg [7:0] in0, in1;
reg clk = 0;
reg s, reset;
wire [7:0]out;

always 
		begin
		#1 clk =~clk;
		end

	mux  a1 (clk, reset, in0, in1, s, out);

initial 
	begin
	in0 = 8'hAA;  in1 = 8'hBB; s=0;
	#2
	in0 = 8'hAA;  in1 = 8'hBB; s=1;
		#2
	$stop;
	end
endmodule