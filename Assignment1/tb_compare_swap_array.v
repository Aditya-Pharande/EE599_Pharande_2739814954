`timescale 1ns/1ns
module tb_compare_swap_array;

parameter N = 8;
reg  [N-1:0][7:0]in;

wire [N-1:0][7:0]out ;



compare_swap_array #(N) m1 (in, out);

initial
begin
 in[0]= 8'b 0000_0011;
 in[1]= 8'b 0110_1011;
 in[2]= 8'b 0110_0011;
 in[3]= 8'b 0110_1011;
 in[4]= 8'b 1110_0011;
 in[5]= 8'b 0110_0011;
 in[6]= 8'b 0000_0011;
 in[7]= 8'b 1110_0011;
#2
$stop;

end
endmodule
