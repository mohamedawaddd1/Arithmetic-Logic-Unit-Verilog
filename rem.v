module rem(
    input [2:0] A,
    input [2:0] B,
    output [2:0] R
);

assign R[2] = A[2];

wire wire1;
assign wire1 = (!A[0]) & (B[1]) & (A[1]);
assign R[1] = B[0] & wire1;

wire wire2;
assign wire2 = !(B[0] & A[1]);
assign R[0] = A[0] & B[1] & wire2;

endmodule