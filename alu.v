module alu(
    input [2:0] A,
    input [2:0] B,
    input [1:0] S,
    output reg [4:0] R,
    output reg SF,
    output reg ZF,
    output reg DZF  
);

wire [3:0] AS_res;

add_sub AS(
    .A(A),
    .B(B),
    .S(S[0]),
    .R(AS_res)
);

wire [4:0] M_res;

mul MUL(
    .A(A),
    .B(B),
    .R(M_res)
);

wire [2:0] R_res;

rem REM(
    .A(A),
    .B(B),
    .R(R_res)
);

always @* begin
    case(S)
    2'b00: begin
        R = {AS_res[3], 1'b0, AS_res[2:0]};
        SF = AS_res[3];
        if ( AS_res[2:0] == 3'b000)
           ZF = 1'b1;
        else
           ZF = 1'b0;
        DZF = 1'b0;
    end
     2'b01: begin
        R = {AS_res[3], 1'b0, AS_res[2:0]};
        SF = AS_res[3];
        if ( AS_res[2:0] == 3'b000)
           ZF = 1'b1;
        else
           ZF = 1'b0;
        DZF = 1'b0;
    end
     2'b10: begin
        R = M_res;
        SF = M_res[4];
        if ( M_res[3:0] == 4'b0000)
           ZF = 1'b1;
        else
           ZF = 1'b0;
        DZF = 1'b0;
    end
     2'b11: begin
        R = {R_res[2], 2'b00, R_res[1:0]};
        SF = R_res[2];
        if ( R_res[1:0] == 2'b00)
           ZF = 1'b1;
        else
           ZF = 1'b0;

        if ( B[1:0] == 2'b00)
           DZF = 1'b1;
        else
           DZF = 1'b0;
    end
    default: begin
        R = 5'b00000;
        SF = 1'b0;
        ZF = 1'b0;
        DZF = 1'b0;
    end
    endcase
end

endmodule