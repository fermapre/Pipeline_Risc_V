module register_file (
    input clk, reset, regwrite,
    input [4:0] reg1, reg2, rd,
    input [31:0] write_data,
    output [31:0] rd1, rd2
);

reg [31:0] Registers [31:0];
integer k;

always @ (negedge clk or posedge reset)
    begin
        if (reset) begin
            for (k = 0; k<32; k = k + 1) begin
                Registers[k] <= 32'b00;
            end
        end
        else if (regwrite) begin
            Registers[rd] <= write_data;
        end
    end

assign rd1 = (reg1 == 5'b0) ? 32'b0 : Registers[reg1];
assign rd2 = (reg2 == 5'b0) ? 32'b0 : Registers[reg2];

endmodule