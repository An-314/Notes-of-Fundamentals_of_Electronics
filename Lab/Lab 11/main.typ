#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  template: "report",
  title: [电子技术基础实验报告],
  info: [Lab 11：猜猜我的生日],
  author: ("Anzreww",),
  time: "2024/05/16",
  contents: true,
)

= 实验目的

如图 @LOCK 所示，用面包板上的 K0~K7、S0 和 S1 的开关动作模拟 0~9 数字键的按键输入。
#figure(
  image("pic/2024-05-18-13-49-47.png", width: 80%),
  caption: [
    实验目的
  ],
)
<LOCK>

当最近四个输入是我的生日（mmdd）时，密码锁打开。在实验中用LED灯模拟密码锁的开关状态。同时，利用4个LED灯显模拟密码锁的输入状态即到目前为止输入正确的位数。这样可以通过观察LED灯的状态来判断输入是否正确。

基于实验套件中的 FPGA 实验板实现该生日密码锁。

该计算器要求实现要求如下：
- 输入
  - K0 $~$ K7 : 【1 位二进制数】 Ki的脉冲表示输入数字i
  - S0 : 【1 位二进制数】 按下表示输入数字8
  - S1 : 【1 位二进制数】 按下表示输入数字9
- 输出
  - L0 $~$ L3 : 【4 位十进制数】 显示当前输入状态
  - L9 : 【1 位二进制数】 显示密码锁状态，1 表示打开，0 表示关闭
其中输入要满足同时最多只有一个输入有效的要求。

其中L0 $~$ L3的编码如下：
#figure(
  three-line-table[
    | 编码 | 含义 |
    | --- | --- |
    | 0000 | 输入没有一位正确 |
    | 0001 | 输入的第一位正确 |
    | 0011 | 输入的前两位正确 |
    | 0111 | 输入的前三位正确 |
    | 1111 | 输入的前四位正确（此时开锁） |
  ],
  caption: [
    LED灯的含义
  ],
  kind: table,
)

= 模块设计与代码实现

#figure(
  image("pic/2024-05-18-13-59-41.png", width: 80%),
  caption: [
    顶层设计图
  ],
)
<module>

如 @module 所示，该计算器由以下模块组成：
- 密码锁有限状态机
- 编码器
- 按键处理模块
- 分频器

其工作原理如下：
- 按键处理模块将不稳定的按键输入信号，转换为可以被电路接受的一次有效的信号。
- 该信号经过编码器编码后，输入到密码锁有限状态机中。
- 密码锁有限状态机根据输入的信号，判断当前输入的状态，并输出到LED灯上。
- 当输入的状态为1111时，密码锁有限状态机输出打开信号，表示密码输入正确，密码锁打开。
- 分频器用于将输入的时钟信号分频，以得到合适的时钟信号，用于驱动其他模块。

== 密码锁有限状态机

该模块实现了一个有限状态机，用于处理密码锁的状态。

代码如下：

```verilog
/*
有限状态机：表示一个密码锁的状态机，密码锁的密码是0521。
传入编码好的十进制数，如果有输入，就判断是否是密码，如果没有输入就保持原来的状态。Unlock输出1表示密码正确，0表示密码错误。Output输出当前状态，即目前输入密码的进度。
@Input: Input[3:0] 输入十进制数
@Input: CLK 时钟信号
@Output: Output[3:0] 输出4位二进制数，表示当前状态
@Output: Unlock 输出1表示密码正确，0表示密码错误
*/

module FiniteStateMachine(Input, CLK, Output, Unlock);
input [3:0] Input;
input CLK;
output reg [3:0] Output;
output reg Unlock;

reg [3:0] state;

// 定义状态参数
parameter S0 = 4'b0000, // 初始状态
          S1 = 4'b0001, // 输入0正确
          S2 = 4'b0011, // 输入5正确
          S3 = 4'b0111, // 输入2正确
          S4 = 4'b1111; // 输入1正确

// 时钟上升沿触发状态转移
always @(posedge CLK) begin
    case (state)
        S0: begin
            if (Input == 4'b0000) begin // 输入0
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b1111) begin // 无输入，保持初始状态
                state <= S0;
                Output <= S0;
            end else begin // 其他输入，保持初始状态
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0; // 未解锁
        end

        S1: begin
            if (Input == 4'b0000) begin // 输入0，保持状态
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b0101) begin // 输入5
                state <= S2;
                Output <= S2;
            end else if (Input == 4'b1111) begin // 无输入，保持状态
                state <= S1;
                Output <= S1;
            end else begin // 其他输入，复位到初始状态
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0; // 未解锁
        end

        S2: begin
            if (Input == 4'b0000) begin // 输入0，复位到第一个正确输入状态
                state <= S1;
                Output <= S1;
            end else if (Input == 4'b0010) begin // 输入2
                state <= S3;
                Output <= S3;
            end else if (Input == 4'b1111) begin // 无输入，保持状态
                state <= S2;
                Output <= S2;
            end else begin // 其他输入，复位到初始状态
                state <= S0;
                Output <= S0;
            end
            Unlock <= 0; // 未解锁
        end

        S3: begin
            if (Input == 4'b0000) begin // 输入0，复位到第一个正确输入状态
                state <= S1;
                Output <= S1;
                Unlock = 0;
            end else if (Input == 4'b0001) begin // 输入1，密码正确
                state <= S4;
                Output <= S4;
                Unlock <= 1;
            end else if (Input == 4'b1111) begin // 无输入，保持状态
                state <= S3;
                Output <= S3;
                Unlock <= 0;
            end else begin // 其他输入，复位到初始状态
                state <= S0;
                Output <= S0;
                Unlock <= 0;
            end
        end

        S4: begin
            if (Input == 4'b0000) begin // 输入0，复位到第一个正确输入状态
                state <= S1;
                Output <= S1;
                Unlock <= 0;
            end else if (Input == 4'b1111) begin // 无输入，保持解锁状态
                state <= S4;
                Output <= S4;
                Unlock <= 1;
            end else begin // 其他输入，复位到初始状态
                state <= S0;
                Output <= S0;
                Unlock <= 0;
            end
        end
    endcase
end

// 初始状态设置
initial begin
    state = S0;
    Output = S0;
    Unlock = 0;
end

endmodule

```
该有限状态机（FSM）模块用于模拟一个密码锁的状态机，密码锁的密码为 `0521`。该模块通过输入一个编码好的十进制数（0-9），来判断输入的数字是否为密码的一部分。如果输入的数字与预期的密码匹配，状态机会根据输入依次转移至下一个状态；如果不匹配，则重置状态机到初始状态。通过时钟信号 `CLK` 驱动状态转移。通过实现 @FSM 所示的状态转移逻辑，实现了一个简单的密码锁状态机。

#figure(
  image("pic/2024-05-18-14-11-00.png", width: 80%),
  caption: [
    FSM状态转换图
  ],
)
<FSM>

== 编码器

该模块实现了一个编码器，用于将输入的十进制数编码为对应的二进制数。

代码如下：
```verilog
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
```
通过`reg`声明的变量`Output`用于存储编码后的二进制数。编码器将输入的十进制数编码为对应的二进制数，在没有输入时输出全1，以便于密码锁有限状态机的判断。

#figure(
  image("pic/2024-05-18-14-59-09.png", width: 80%),
  caption: [
    编码器的 RTL 图
  ],
)

== 按键处理

该模块实现了一个按键处理模块，用于处理按键输入信号，将不稳定的按键输入信号转换为可以被电路接受的一次有效的信号。

代码如下：
```verilog
/*
按键处理：用一个变量有时序地记录按键状态：00 -> 01 -> 11 -> 10 -> 00；以便检测按键的按下和松开
@Input CLK: 时钟信号
@Input Key: 按键信号
@Output isPressed: 按键状态，1表示按键按下，0表示按键未按下
*/
module Button(CLK, Key, isPressed);
input CLK;
input Key;
output reg isPressed;

reg [1:0] state; // 2位状态寄存器，用于记录按键状态

always @(posedge CLK) begin
    case (state)
        2'b00: begin // 初始状态，按键未按下
            if (Key == 1) begin
                state <= 2'b01; // 检测到按键按下
                isPressed <= 1'b1; // 标记按键按下
            end else begin
                state <= 2'b00; // 保持在初始状态
                isPressed <= 1'b0; // 按键未按下
            end
        end
        2'b01: begin // 按键按下状态
            if (Key == 1) begin
                state <= 2'b11; // 按键保持按下
                isPressed <= 1'b0; // 清除按键按下标记
            end else begin
                state <= 2'b10; // 按键松开
                isPressed <= 1'b0; // 按键未按下
            end
        end
        2'b11: begin // 按键保持按下状态
            if (Key == 1) begin
                state <= 2'b11; // 按键继续保持按下
                isPressed <= 1'b0; // 按键按下标记保持清除
            end else begin
                state <= 2'b10; // 按键松开
                isPressed <= 1'b0; // 按键未按下
            end
        end
        2'b10: begin // 按键松开状态
            if (Key == 1) begin
                state <= 2'b01; // 按键再次按下
                isPressed <= 1'b0; // 按键未按下
            end else begin
                state <= 2'b00; // 回到初始状态
                isPressed <= 1'b0; // 按键未按下
            end
        end
    endcase
end

endmodule
```
按键处理模块通过`reg`声明的变量`state`记录按键状态，以便检测按键的按下和松开。当检测到按键按下时，将`isPressed`置为1，表示按键按下；当检测到按键松开时，将`isPressed`置为0，表示按键未按下。事实上，这个模块也等价于一个有限状态机，通过实现 @Button 所示的状态转移逻辑，实现了一个简单的按键处理模块。

#figure(
  image("pic/2024-05-18-15-33-49.png", width: 80%),
  caption: [
    按键处理模块的状态转换图
  ],
)
<Button>

== 分频器

该模块实现了一个分频器，用于将输入的时钟信号分频，以得到合适的时钟信号，用于驱动其他模块。

代码如下：
```verilog
/*
分频器：把一个50MHz的CLK_in信号分频成5kHz的CLK信号
@Input CLK_in: 50MHz时钟信号
@Output CLK: 5kHz时钟信号
*/

module FrequencyDivider(CLK_in, CLK);
input CLK_in;
output reg CLK;

parameter DIVISOR = 4999;
reg [13:0] counter; // 14位计数器，用于计数时钟周期数

// 在CLK_in的上升沿触发
always @(posedge CLK_in) begin
    if (counter == DIVISOR - 1) begin // 当计数器达到分频系数减1时
        counter <= 0; // 计数器重置为0
        CLK <= ~CLK; // 翻转输出时钟信号
    end else begin
        counter <= counter + 1; // 计数器加1
    end
end

endmodule
```
通过计数器的方式，将输入的时钟信号分频，以得到合适的时钟信号，用于驱动其他模块。在计数器达到分频系数减1时，翻转输出时钟信号，实现了一个简单的分频器。

#figure(
  image("pic/2024-05-18-15-42-12.png", width: 80%),
  caption: [
    分频器的 RTL 图
  ],
)

== 顶层模块

顶层模块将上述模块进行实例化，并将它们连接在一起，实现了一个完整的生日密码锁。

代码如下：
```verilog
/*
锁定模块：结合分频器、按键处理、编码器和有限状态机，实现一个密码锁的功能
@Input Input: 10位按键信号输入
@Input CLK_in: 输入时钟信号
@Output State: 4位当前状态信号
@Output Unlock: 解锁信号，1表示解锁成功，0表示解锁失败
*/

module Lock(Input, CLK_in, State, Unlock);
input [9:0] Input; // 10个按键输入信号
input CLK_in; // 输入时钟信号
output wire [3:0] State; // 当前状态输出
output wire Unlock; // 解锁信号输出

// 内部信号定义
wire [9:0] isPressed; // 按键状态信号
wire CLK; // 分频后的时钟信号
wire [3:0] encoded; // 编码后的按键信号

// 分频器实例化，将输入的时钟信号分频为较低频率
FrequencyDivider FreqDiv(CLK_in, CLK);

// 按键处理模块实例化，将每个按键信号处理为稳定的按键状态信号
Button Btn0(CLK, Input[0], isPressed[0]);
Button Btn1(CLK, Input[1], isPressed[1]);
Button Btn2(CLK, Input[2], isPressed[2]);
Button Btn3(CLK, Input[3], isPressed[3]);
Button Btn4(CLK, Input[4], isPressed[4]);
Button Btn5(CLK, Input[5], isPressed[5]);
Button Btn6(CLK, Input[6], isPressed[6]);
Button Btn7(CLK, Input[7], isPressed[7]);
Button Btn8(CLK, Input[8], isPressed[8]);
Button Btn9(CLK, Input[9], isPressed[9]);

// 编码器实例化，将10个按键的按下状态编码为4位二进制数
Encoder Enc(isPressed, CLK, encoded);

// 有限状态机实例化，根据编码后的按键信号和时钟信号生成当前状态和解锁信号
FiniteStateMachine FSM(encoded, CLK, State, Unlock);

endmodule
```

#figure(
  image("pic/2024-05-18-15-43-05.png", width: 80%),
  caption: [
    顶层模块的 RTL 图
  ],
)

= 电路搭建与调试

在编写好程序之后，使用实验套件中的 FPGA 实验板，设计IO引脚的连接关系，如下表所示：

#figure(
  three-line-table[
    | 模块 | I/O | FPGA引脚 | 实验板引脚 |
    | --- | --- | --- | --- |
    | Input[0] | Input | PIN_113 | K0 |
    | Input[1] | Input | PIN_112 | K1 |
    | Input[2] | Input | PIN_111 | K2 |
    | Input[3] | Input | PIN_100 | K3 |
    | Input[4] | Input | PIN_84 | K4 |
    | Input[5] | Input | PIN_83 | K5 |
    | Input[6] | Input | PIN_75 | K6 |
    | Input[7] | Input | PIN_74 | K7 |
    | Input[8] | Input | PIN_73 | S0 |
    | Input[9] | Input | PIN_72 | S1 |
    | CLK_in | Input | PIN_23 |  |
    | Output[0] | Output | PIN_128 | L0 |
    | Output[1] | Output | PIN_127 | L1 |
    | Output[2] | Output | PIN_126 | L2 |
    | Output[3] | Output | PIN_126 | L3 |
    | Unlock | Output | PIN_120 | L9 |
  ],
  caption: [
    引脚连接表
  ],
  kind: table,
)

将电路搭建好之后，通过实验套件中的开发工具下载程序到 FPGA 实验板上，进行调试。在调试过程中，可以通过按下开发板上的按钮，输入不同的数字，观察LED灯的状态变化，以验证程序的正确性。

#figure(
  image("pic/2024-05-18-16-02-02.png", width: 80%),
  caption: [
    实验板电路搭建图
  ],
)


= 实验结果与分析

验证实验结果如下：

分别输入 `0`、`5`、`1`、`0`、`4`、`0`、`5`、`2`、`1`、`0`，可以看到LED灯的状态变化如下：
1. `0001000000`，输入的第一位正确
2. `0011000000`，输入的前两位正确
3. `0111000000`，输入的前三位正确
4. `0001000000`，回到第一位输入正确的状态
5. `0000000000`，变成初始状态
6. `0001000000`，输入的第一位正确
7. `0011000000`，输入的前两位正确
8. `0111000000`，输入的前三位正确
9. `1111000001`，输入的前四位正确，解锁成功
10. `0001000000`，回到第一位输入正确的状态

通过观察LED灯的状态变化，可以验证实验结果的正确性。实验结果表明，通过实现的生日密码锁，可以根据输入的按键信号，判断密码是否正确，从而实现密码锁的功能。

综上所述，本次实验成功实现了一个生日密码锁，通过按键输入模拟密码输入，通过LED灯显示密码锁的状态，实现了密码锁的功能。通过实验，加深了对有限状态机、编码器、按键处理和分频器等模块的理解，提高了实验设计和调试的能力。
