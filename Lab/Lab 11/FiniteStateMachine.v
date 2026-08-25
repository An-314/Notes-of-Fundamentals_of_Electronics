/*   
有限状态机：来表示一个密码锁的状态机，密码锁的密码是0521。传入编码好的十进制数，如果有输入，就判断是否是密码，如果没有输入就保持原来的状态。Unloc输出1表示密码正确，0表示密码错误。Output输出当前状态，即目前输入密码的进度。
@Input: Input[3:0] 输入十进制数
@Input: CLK 时钟信号
@Output: Output[3:0] 输出4位二进制数
@Output: State[3:0] 输出当前状态
*/
module FiniteStateMachine(Input, CLK, Output, Unlock);
input [3:0] Input;
input CLK;
output reg [3:0] Output;
output reg Unlock;

reg [3:0] state;

parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0011, S3 = 4'b0111, S4 = 4'b1111;
always @(posedge CLK) begin
    case (state)
        S0: begin
            if (Input == 4'b0000) begin
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b1111) begin
                state <= S0;
                Output <= S0;
            end else begin
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0;
        end
        S1: begin
            if (Input == 4'b0000) begin
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b0101) begin
                state <= S2;
                Output <= S2;
            end else if (Input == 4'b1111) begin
                state <= S1;
                Output <= S1;
            end else begin
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0;
        end
        S2: begin
            if (Input == 4'b0000) begin
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b0010) begin
                state <= S3;
                Output <= S3;
            end else if (Input == 4'b1111) begin
                state <= S2;
                Output <= S2;
            end else begin
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0;
        end
        S3: begin
            if (Input == 4'b0000) begin
                state <= S1;
                Output <= S1;
                Unlock = 0;
            end else if (Input == 4'b0001) begin
                state <= S4;
                Output <= S4;
                Unlock <= 1;
            end else if (Input == 4'b1111) begin
                state <= S3;
                Output <= S3;
                Unlock <= 0;
            end else begin
                state <= S0;
                Output <= S0;
                Unlock <= 0;
            end
        end
        S4: begin
            if (Input == 4'b0000) begin
                state <= S1;
                Output <= S1;
                Unlock <= 0;
            end else if (Input == 4'b1111) begin
                state <= S4;
                Output <= S4;
                Unlock <= 1;
            end else begin
                state <= S0;
                Output <= S0;
                Unlock <= 0;
            end
        end
    endcase
end

endmodule