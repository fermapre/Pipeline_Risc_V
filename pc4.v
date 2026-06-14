module pc4(pc, pc_next);
    input [31:0] pc;
    output [31:0] pc_next;

    assign pc_next = pc + 4;

endmodule