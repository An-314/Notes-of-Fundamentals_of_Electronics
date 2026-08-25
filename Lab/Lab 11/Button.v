/*
按键处理：用一个变量有时序的记录按键状态：00 -> 01 -> 11 -> 10 -> 00；以便检测按键的按下和松开
@Input CLK: 时钟信号
@Input Key: 按键信号
@Output isPressed: 按键状态
*/
module Button(CLK, Key, isPressed);
input CLK;
input Key;
output reg isPressed;

reg [1:0] state;

always @(posedge CLK) begin
    case (state)
        2'b00: begin
            if (Key == 1) begin
                state <= 2'b01;
                isPressed <= 1'b1;
            end else begin
                state <= 2'b00;
                isPressed <= 1'b0;
            end
        end
        2'b01: begin
            if (Key == 1) begin
                state <= 2'b11;
                isPressed <= 1'b0;
            end else begin
                state <= 2'b10;
                isPressed <= 1'b0;
            end
        end
        2'b11: begin
            if (Key == 1) begin
                state <= 2'b11;
                isPressed <= 1'b0;
            end else begin
                state <= 2'b10;
                isPressed <= 1'b0;
            end
        end
        2'b10: begin
            if (Key == 1) begin
                state <= 2'b01;
                isPressed <= 1'b0;
            end else begin
                state <= 2'b00;
                isPressed <= 1'b0;
            end
        end
    endcase
end

endmodule

