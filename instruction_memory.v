module instruction_memory(
    input [31:0] read_address,
    output [31:0] inst_out
);

reg [31:0] i_mem [63:0];

initial begin
        $readmemh("programa.mem", i_mem);
end

assign inst_out = i_mem[read_address[7:2]];

endmodule