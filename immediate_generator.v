module immediate_generator(
    input [6:0] op,
    input [31:0] instr,
    output reg [31:0] imm_ex
);

always @(*)
    begin
        case(op)
            7'b0000011: imm_ex = {{20{instr[31]}}, instr[31:20]};
            7'b0010011: imm_ex = {{20{instr[31]}}, instr[31:20]};
            7'b0100011: imm_ex = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            7'b1100011: imm_ex = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
            default:    imm_ex = 32'b0;
        endcase
    end
endmodule
