module data_memory (clk, reset, MemWrite, MemRead, read_address, Write_data, MemData_out);
    input clk, reset, MemWrite, MemRead;
    input [31:0] read_address, Write_data;
    output [31:0] MemData_out;

    reg [31:0] D_memory[63:0];
    integer k;

always @(posedge clk or posedge reset)
    begin 
        if(reset)
            begin   
                for (k = 0; k<64; k = k + 1) begin
                    D_memory[k] <= 32'b00;
                end
                end
                else if (MemWrite) begin
                    D_memory[read_address[7:2]] <= Write_data;
                end
    end

assign MemData_out = (MemRead) ? D_memory[read_address[7:2]] : 32'b0;

endmodule
