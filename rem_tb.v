module rem_tb;

reg [2:0] A;
reg [2:0] B;
wire [2:0] R;

rem DUT(
    .A(A),
    .B(B),
    .R(R)
);

integer i;
integer j;
integer file3;

initial begin
    file3 = $fopen("rem.txt", "w");

    if(file3) begin
    for (i = -3; i<=3; i=i+1) begin
        A= i;
        for (j = -3; j<=3; j=j+1) begin
            B=j;
            #100;
            if (B[1:0] == 2'b00 || A[2] == 1'b0 || A[2] == 1'b1 || B[2] == 1'b0 || B[2] == 1'b1) begin
               $display("Pass_%b_%b_%b", A, B, R);
               $fwrite(file3, "Pass_%b_%b_%b \n", A, B, R);
            end
            else
               $display("Fail Invalid Selection");
            end
    end
    $fclose(file3);
end
    else
    $display("Error opening file");
    $finish();
end

endmodule