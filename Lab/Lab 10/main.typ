#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础实验报告],
  info: [Lab 10：基于 FPGA 的简易计算器],
  author: ("Anzreww",),
  time: "2024/05/09",
  contents: true,
)

= 实验目的

基于实验套件中的 FPGA 实验板实现如下图所示的简易计算器：

#figure(
  image("pic/2024-05-10-16-08-51.png", width: 80%),
  caption: [
    简易计算器电路图
  ],
)
<calculator>

该计算器要求实现要求如下：
- 输入
  - A : 【3 位二进制数】 运算数
  - B : 【3 位二进制数】 运算数
  - K : 【2 位二进制数】 运算符
- 输出
  - R_H : 【1 位十进制数】 结果的高位
  - R_L : 【7 位二进制数】 结果的低位
  - Sign : 【1 位二进制数】 结果的符号
其中R_H直接接入带有译码器的七段数码管，R_L需要手动译码、输出一个【7位二进制数】，Sign接入一个LED灯。

其中K的编码如下：
#figure(
  three-line-table[
    | 编码 | 运算符 |
    | --- | --- |
    | 00 | 加法 |
    | 01 | 减法 |
    | 10 | 乘法 |
    | 11 | 除法 |
  ],
  caption: [
    运算符编码表
  ],
  kind: table,
)

= 模块设计与程序实现

如 @calculator 所示，该计算器由以下模块组成：
- 运算器
- 显示译码器

== 运算器

该模块实现了一个简单的计算器，根据输入的运算符K，对输入的A和B进行相应的运算，并输出结果R_H、R_L和Sign。

代码如下：

```verilog
// 模块：Operator
// 功能：执行加、减、乘、除运算，并处理结果的符号和位数。
module Operator(A, B, K, Sign, RL, RH);
    input [2:0] A, B;        // 输入：操作数
    input [1:0] K;           // 输入：运算符
    output Sign;             // 输出：符号位
    output [3:0] RL, RH;     // 输出：低位和高位
    reg Sign;
    reg [3:0] RL, RH;
    reg [7:0] result;        // 计算结果，最大可能需要8位来存储结果

    always @(A, B, K) begin
        case (K)
            2'b00:  // 加法 A + B
            begin
                result = A + B;
                Sign = 1'b0;
            end
            2'b01:  // 减法 A - B
            begin
                if (A < B) begin
                    Sign = 1'b1;
                    result = B - A;
                end else begin
                    Sign = 1'b0;
                    result = A - B;
                end
            end
            2'b10:  // 乘法 A * B
            begin
                result = A * B;
                Sign = 1'b0;
            end
            2'b11:  // 除法 A / B
            begin
                result = (B != 1'b0) ? A / B : 1'b0;  // 防止除零错误
                Sign = 1'b0;
            end
        endcase
        // 将结果转换为十进制的两位数
        RL = result % 4'd10;
        RH = result / 4'd10;
    end
endmodule
```
通过`reg`声明的变量`Sign`、`RL`和`RH`用于存储计算结果，`result`用于存储计算的中间结果。`always`块根据输入的运算符`K`，对输入的`A`和`B`进行相应的运算，并将结果存储在`result`中。最后，将`result`转换为十进制的两位数，分别存储在`RL`和`RH`中。

#figure(
  image("pic/2024-05-11-17-48-12.png", width: 80%),
  caption: [
    运算器原理图截图
  ],
)

== 显示译码器

该模块实现了一个简单的显示译码器，将运算结果的十进制数转换为对应的七段数码管的编码，并输出到数码管上。

代码如下：
```verilog
// 模块：Display
// 功能：根据输入的数字，控制七段显示器的显示。
module Display(RL, LED);
    input [3:0] RL;          // 输入：需要显示的数字（低位）
    output [6:0] LED;        // 输出：七段显示器的控制信号
    reg [6:0] LED;

    // 七段显示器编码表
    always @(RL) begin
        case (RL)
            4'd0: LED = 7'b1111110;
            4'd1: LED = 7'b0110000;
            4'd2: LED = 7'b1101101;
            4'd3: LED = 7'b1111001;
            4'd4: LED = 7'b0110011;
            4'd5: LED = 7'b1011011;
            4'd6: LED = 7'b1011111;
            4'd7: LED = 7'b1110000;
            4'd8: LED = 7'b1111111;
            4'd9: LED = 7'b1111011;
        endcase
    end
endmodule
```
通过`reg`声明的变量`LED`用于存储七段数码管的控制信号。`always`块根据输入的数字`RL`，将其转换为对应的七段数码管的编码，并存储在`LED`中。

== 顶层模块

顶层模块将运算器和显示译码器连接在一起，实现了一个简易的计算器。

代码如下：
```verilog
// 主模块：Calculator
// 功能：根据输入的操作数和运算符，进行算术运算，并通过七段显示器显示结果。
module Calculator(A, B, K, RH, Sign, LED);
    input [2:0] A, B;        // 输入：操作数A和B，3位二进制数
    input [1:0] K;           // 输入：运算符，2位二进制数，00表示加法，01表示减法，10表示乘法，11表示除法
    output Sign;             // 输出：符号位，1表示负数，0表示正数或零
    output [6:0] LED;        // 输出：七段显示器，用于显示低位结果
    output [3:0] RH;         // 输出：结果的高位部分

    wire [3:0] RL;           // 内部连接线：结果的低位部分

    // 实例化Operator模块
    Operator O(A, B, K, Sign, RL, RH);
    // 实例化Display模块
    Display D(RL, LED);
endmodule
```
通过`wire`声明的变量`RL`用于连接运算器和显示译码器。`Operator`模块实例化了运算器，`Display`模块实例化了显示译码器。顶层模块将运算器和显示译码器连接在一起，实现了一个简易的计算器。

#figure(
  image("pic/2024-05-11-17-47-17.png", width: 80%),
  caption: [
    顶层原理图截图
  ],
)

= 电路搭建与调试

在编写好程序之后，使用实验套件中的 FPGA 实验板，设计IO引脚的连接关系，如下表所示：

#figure(
  three-line-table[
    | 模块 | I/O | FPGA引脚 | 实验板引脚 |
    | --- | --- | --- | --- |
    | A[2] | Input | PIN_74 | K0 |
    | A[1] | Input | PIN_73 | K1 |
    | A[0] | Input | PIN_72 | K2 |
    | B[2] | Input | PIN_142 | K3 |
    | B[1] | Input | PIN_125 | K4 |
    | B[0] | Input | PIN_119 | K5 |
    | K[1] | Input | PIN_114 | K6 |
    | K[0] | Input | PIN_106 | K7 |
    | LED[6] | Output | PIN_127 | a |
    | LED[5] | Output | PIN_126 | b |
    | LED[4] | Output | PIN_124 | c |
    | LED[3] | Output | PIN_120 | d |
    | LED[2] | Output | PIN_113 | e |
    | LED[1] | Output | PIN_112 | f |
    | LED[0] | Output | PIN_111 | g |
    | RH[3] | Output | PIN_138 | A |
    | RH[2] | Output | PIN_141 | B |
    | RH[1] | Output | PIN_143 | C |
    | RH[0] | Output | PIN_144 | D |
    | Sign | Output | PIN_100 | L0 |
  ],
  caption: [
    引脚连接表
  ],
  kind: table,
)

将电路搭建好之后，通过实验套件中的开发工具下载程序到 FPGA 实验板上，进行调试。在调试过程中，可以通过按下开发板上的按钮，输入不同的操作数和运算符，观察七段数码管和LED灯的显示情况，验证计算器的功能是否正常。


= 实验结果与分析

验证实验结果如下：
1. 输入A=100、B=110、K=00（加法），计算结果为10，显示正数。

#figure(
  image("pic/2024-05-10-16-35-48.png", width: 80%),
  caption: [
    加法计算结果
  ],
)

2. 输入A=100、B=101、K=01（减法），计算结果为01，显示负数。

#figure(
  image("pic/2024-05-10-16-41-52.png", width: 80%),
  caption: [
    减法计算结果
  ],
)

_对于图中数码管，排查过后是板子本身的问题，后面会做出解释。_

3. 输入A=100、B=101、K=10（乘法），计算结果为110，显示正数。

#figure(
  image("pic/2024-05-10-16-44-32.png", width: 80%),
  caption: [
    乘法计算结果
  ],
)

4. 输入A=100、B=100、K=11（除法），计算结果为00，显示正数。

#figure(
  image("pic/2024-05-10-16-45-40.png", width: 80%),
  caption: [
    除法计算结果
  ],
)

通过实验结果可以看出，实验中设计的简易计算器能够正确地进行加、减、乘、除运算，并能够正确地显示结果的符号和位数。

*下面是实验板的问题：*

在去掉FPGA板的供电后，直接将实验板上的abcdefg引脚连接入高电平（下图中的白线），观察数码管的亮暗情况。

发现当接入c或者d时候，这两个引脚对应的数码管会同时亮起，这也是上面的实验结果中数码管显示不正常的原因。

#figure(
  image("pic/2024-05-10-16-51-24.png", width: 80%),
  caption: [
    实验板数码管亮暗情况
  ],
)

同样，当接入g引脚时，数码管会显示为本应亮起的数码管不亮，这也是上面的实验结果中数码管显示不正常的原因。

#figure(
  image("pic/2024-05-10-16-52-47.png", width: 80%),
  caption: [
    实验板数码管亮暗情况
  ],
)

在发现这个问题后，再对应上面的实验结果，会发现排除数码管显示不正常的干扰，实验结果是正确的。
