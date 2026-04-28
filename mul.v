module HA(
    input a,
    input b,
    output sum,
    output cout
);
assign sum = a ^ b;
assign cout = a & b;
endmodule

module mul(
    input [2:0] A,
    input [2:0] B,
    output [4:0] R
);

assign R[0] = A[0] & B[0];
assign R[4] = A[2] ^ B[2];

wire wire3;
wire wire1;

HA halfadder1(
.a(A[1] & B[0]),
.b(A[0] & B[1]),
.sum(R[1]),
.cout(wire3)
);

HA halfadder2(
.a(wire3),
.b(A[1] & B[1]),
.sum(R[2]),
.cout(R[3])
);

endmodule