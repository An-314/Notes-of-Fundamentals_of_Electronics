module Calculator(A, B, K, RH, Sign, LED);
input [2:0] A, B;
input [1:0] K;
output Sign;
output [6:0] LED;
output [3:0] RH;
wire [3:0] RL;

Operator O(A, B, K, Sign, RL, RH);
Display D(RL, LED);
endmodule



module Operator(A, B, K, Sign, RL, RH);
input [2:0] A, B;    // 操作数【二进制】
input [1:0] K;       // 运算符
output Sign;         // 符号位
output [3:0] RL, RH; // 低位和高位【十进制】
reg Sign;
reg [3:0] RL, RH;
reg [7:0] result;

always @(A, B, K) begin
    // 选择运算
    case (K)
        2'b00 : // A + B
        begin
            result = A + B;
            Sign = 1'b0;
        end
        2'b01 : // A - B
        begin
            if(A < B) begin
                Sign = 1'b1;
                result = B - A;
            end
            else begin
                Sign = 1'b0;
                result = A - B;
            end
        end
        2'b10 : // A * B
        begin
            result = A * B;
            Sign = 1'b0;
        end
        2'b11 : // A / B
        begin
            result = A / B;
            Sign = 1'b0;
        end
    endcase
    // 将结果转换为十进制的两位数
    RL = result % 4'd10;
    RH = result / 4'd10;
end
endmodule


module Display(RL, LED);
input [3:0] RL;
output [6:0] LED;
reg [6:0] LED;

// 板子上abcdefg对应的七段数码管的编码
always @(RL) begin
    case (RL)
        4'd0 : LED = 7'b1111110;
        4'd1 : LED = 7'b0110000;
        4'd2 : LED = 7'b1101101;
        4'd3 : LED = 7'b1111001;
        4'd4 : LED = 7'b0110011;
        4'd5 : LED = 7'b1011011;
        4'd6 : LED = 7'b1011111;
        4'd7 : LED = 7'b1110000;
        4'd8 : LED = 7'b1111111;
        4'd9 : LED = 7'b1111011;
    endcase
end
endmodule