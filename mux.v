module mux (sel1, A1, B1, mux_out);
    input sel1;
    input [31:0] A1, B1;
    output [31:0] mux_out;

assign mux_out = (sel1 == 1'b0) ? A1:B1;

endmodule