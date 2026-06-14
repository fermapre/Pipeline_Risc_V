module alu_control (op, func7, func3, control_out);
    input func7;
    input [2:0] func3;
    input [1:0] op;
    output reg [3:0] control_out;

always @(*)
    begin
        case(op)
            2'b00: control_out = 4'b0010;
            2'b01: control_out = 4'b0110;
            2'b10: begin
                case({func7, func3})
                    4'b0_000: control_out = 4'b0010;
                    4'b1_000: control_out = 4'b0110;
                    4'b0_111: control_out = 4'b0000;
                    4'b0_110: control_out = 4'b0001;
                    default:  control_out = 4'b0010;
                endcase
            end
            default: control_out = 4'b0010;
        endcase
    end

endmodule
