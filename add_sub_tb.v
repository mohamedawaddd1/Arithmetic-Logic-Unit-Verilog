module add_sub_tb;

reg [2:0] A;
reg [2:0] B;
reg S;
wire [3:0] R;

add_sub DUT(
    .A(A),
    .B(B),
    .S(S),
    .R(R)
);

integer i;
integer j;
integer k;
integer file1, file2;

initial begin

    file1 = $fopen("add.txt", "w");
    file2 = $fopen("sub.txt", "w");

    if(file1 && file2) begin
    for (i = -3; i<=3; i=i+1) begin
        A= i;
        for (j = -3; j<=3; j=j+1) begin
            B=j;
            for (k = 0; k<2; k=k+1)begin
                S=k;
                #100;
                
                case(k)
                1'b0: begin
                  $display("Pass_%b_%b_%b", A, B, R);
                  $fwrite(file1, "Pass_%b_%b_%b \n", A, B, R);
                end
                1'b1: begin
                  $display("Pass_%b_%b_%b", A, B, R);
                  $fwrite(file2, "Pass_%b_%b_%b \n", A, B, R);
                end
                default: $display("Fail Invalid Selection");
                endcase
            end
        end
    end
    $fclose(file1);
    $fclose(file2);
    end
    else 
    $display("Error opening files");
    $finish();
end

endmodule