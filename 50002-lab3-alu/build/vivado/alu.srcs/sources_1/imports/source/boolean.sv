/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module boolean #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [5:0] alufn,
        output reg [(SIZE)-1:0] bool
    );
    always @* begin
        
        case (alufn[2'h3:1'h0])
            4'h8: begin
                bool = a & b;
            end
            4'he: begin
                bool = a | b;
            end
            4'h6: begin
                bool = a ^ b;
            end
            4'ha: begin
                bool = a;
            end
            default: begin
                bool = 1'h0;
            end
        endcase
    end
    
    
endmodule