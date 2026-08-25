/* 
十进制编码器：将十进制数编码为4位二进制数，没有输入时输出全1
@Input: Input[9:0] 输入十进制数
@Input: CLK 时钟信号
@Output: Output[3:0] 输出4位二进制数
*/

module Encoder(Input, CLK, Output);
input [9:0] Input;
input CLK;
output reg [3:0] Output;

always @(posedge CLK) begin
    case (Input)
        10'b0000000001: Output <= 4'b0000;
        10'b0000000010: Output <= 4'b0001;
        10'b0000000100: Output <= 4'b0010;
        10'b0000001000: Output <= 4'b0011;
        10'b0000010000: Output <= 4'b0100;
        10'b0000100000: Output <= 4'b0101;
        10'b0001000000: Output <= 4'b0110;
        10'b0010000000: Output <= 4'b0111;
        10'b0100000000: Output <= 4'b1000;
        10'b1000000000: Output <= 4'b1001;
        default: Output <= 4'b1111;
    endcase
end

endmodule