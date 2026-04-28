module mul_tb;

reg [2:0] A;
reg [2:0] B;
wire [4:0] R;

mul DUT(
    .A(A),
    .B(B),
    .R(R)
);

integer i;
integer j;
integer file4;

initial begin
    file4 = $fopen("mult.txt", "w");

    if(file4) begin
    for (i = -3; i<=3; i=i+1) begin
        A= i;
        for (j = -3; j<=3; j=j+1) begin
            B=j;
            #100;
                if (A[1:0] * B[1:0] || A[2] != B[2] || A[2] == B[2]) begin
                    $display("Pass_%b_%b_%b", A, B, R);
                    $fwrite(file4, "Pass_%b_%b_%b \n", A, B, R);
                end
                else
                    $display("Fail Invalid Selection");
        end
    end
    $fclose(file4);
end
    else
    $display("Error opening file");
    $finish();
end

endmodule