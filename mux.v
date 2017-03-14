// (c) Aldec, Inc.
// All rights reserved.
//
// Last modified: $Date: 2008-09-23 12:16:54 +0200 (Tue, 23 Sep 2008) $
// $Revision: 92945 $

`timescale 1ps / 1ps

// Verilog Model of 2 to 1 Multiplexer with 5 bits output.
// Input A is 4-bits, input B is 5-bits
module MUX (A, B, Y, S);
input  [3:0]A;
input  [4:0]B;
output [4:0]Y;
input  S;

assign    Y = (S == 1'b1) ? B : { 1'b0, A };    // bits concatenation

endmodule
