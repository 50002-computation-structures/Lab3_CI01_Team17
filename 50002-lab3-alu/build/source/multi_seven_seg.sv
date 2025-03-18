/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module multi_seven_seg #(
        parameter DIGITS = 3'h4,
        parameter DIV = 5'h10
    ) (
        input wire clk,
        input wire rst,
        input wire [(DIGITS)-1:0][3:0] values,
        output reg [6:0] seg,
        output reg [(DIGITS)-1:0] sel
    );
    localparam DIGIT_BITS = $clog2(DIGITS);
    localparam _MP_SIZE_298260616 = DIGIT_BITS;
    localparam _MP_DIV_298260616 = DIV;
    localparam _MP_TOP_298260616 = DIGITS - 1'h1;
    localparam _MP_UP_298260616 = 1'h1;
    logic [(_MP_SIZE_298260616)-1:0] M_ctr_value;
    
    counter #(
        .SIZE(_MP_SIZE_298260616),
        .DIV(_MP_DIV_298260616),
        .TOP(_MP_TOP_298260616),
        .UP(_MP_UP_298260616)
    ) ctr (
        .clk(clk),
        .rst(rst),
        .value(M_ctr_value)
    );
    
    
    logic [3:0] M_seg_dec_char;
    logic [6:0] M_seg_dec_segs;
    
    seven_seg seg_dec (
        .char(M_seg_dec_char),
        .segs(M_seg_dec_segs)
    );
    
    
    localparam _MP_WIDTH_601165770 = DIGIT_BITS;
    logic [(_MP_WIDTH_601165770)-1:0] M_digit_dec_in;
    logic [({1'h1, {_MP_WIDTH_601165770{1'h0}}})-1:0] M_digit_dec_out;
    
    decoder #(
        .WIDTH(_MP_WIDTH_601165770)
    ) digit_dec (
        .in(M_digit_dec_in),
        .out(M_digit_dec_out)
    );
    
    
    always @* begin
        M_seg_dec_char = values[M_ctr_value];
        seg = M_seg_dec_segs;
        M_digit_dec_in = M_ctr_value;
        sel = M_digit_dec_out;
    end
    
    
endmodule