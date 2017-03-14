// (c) Aldec, Inc.
// All rights reserved.
//
// Last modified: $Date: 2008-09-23 12:16:54 +0200 (Tue, 23 Sep 2008) $
// $Revision: 92945 $

`timescale 1ps / 1ps

// Verilog model of Pseudo Random Numbers Generator with Asynchronous Reset
// and Count Enable, for numbers from 1 to 11

module GEN (CLK, RES, DO, ENC);
input  CLK;
input  RES;
output [3:0]DO ;
input  ENC;
//
reg  [3:0]DOINT;
reg tmp;

//initial                        // cannot be synthesized !!
//      DOINT = 4'b0000;

always @ (posedge CLK or posedge RES)
begin
    if (RES)
        DOINT = 4'b0001;
    else if (ENC == 1'b1) // active edge of clock and clock enable
    begin
        tmp = DOINT[3];
        DOINT[3:1] = DOINT[2:0];
        DOINT[0] = DOINT[0] ^ tmp;
    end
end

assign DO[3] = DOINT[3] & ~(DOINT[3] & DOINT[2]);
assign DO[2:0] = DOINT[2:0];

endmodule
