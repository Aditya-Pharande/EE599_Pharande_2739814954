`timescale 1ns/1ns
module tb_compare_swap;


reg [7:0]in1, in2;
wire[7:0]out1, out2;



compare_swap m2 (in1,in2, out1, out2);

initial
begin
 in1= 8'b 0000_0011;
 in2= 8'b 0110_0011;
#2
in1= 8'b 1100_0011;
 in2= 8'b 0110_0011;

#2
in1= 8'b 1100_0011;
 in2= 8'b 1100_0011;
#2
$stop;

end
endmodule
