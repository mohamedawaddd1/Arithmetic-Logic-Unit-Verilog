module add_sub(
    input [2:0] A,
    input [2:0] B,
    input S,
    output [3:0] R
);

reg[3:0] sum;
reg[3:0] subtraction;

always @* begin

    if(S==1'b0) begin

    if (A[2] == B[2]) begin
        sum[2:0] = A[1:0] + B[1:0];
        sum[3] = A[2];
    end
    else begin
        if (A[1:0] >= B[1:0]) begin
            sum[2:0] = A[1:0] - B[1:0];
            sum[3] = A[2];
        end
        else begin
            sum[2:0] = B[1:0] - A[1:0];
            sum[3] = B[2];
        end
    end
    end

    else if(S==1'b1) begin
         
        if (A[2] != B[2]) begin
           subtraction[2:0] = A[1:0] + B[1:0];
           subtraction[3] = A[2];
        end
        else begin
            if (A[1:0] >= B[1:0]) begin
            subtraction[2:0] = A[1:0] - B[1:0];
            subtraction[3] = A[2];
        end
        else begin
            subtraction[2:0] = B[1:0] - A[1:0];
            subtraction[3] = !A[2];
        end
        end
    end
end

assign R = (S == 1'b0) ? sum[3:0] : subtraction[3:0];

endmodule