#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第9次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 82%) = align(center, image(path, width: width))

#exercise(subname: [6.2])[
  分析图 P6.2 时序电路的逻辑功能，写出驱动方程、状态方程和输出方程，画出状态转换图，并说明能否自启动。
]
#solution[
  三个 D 触发器的驱动方程为
  $
    D_1=Q_3', quad D_2=Q_1, quad D_3=Q_1 Q_2.
  $
  因 $Q_i^+=D_i$，状态方程直接由上式得到。该电路为 Moore 型时序电路；状态转换图包含无效状态返回有效循环的路径，所以可以自启动。原状态图及输出方程如下。
  #hw-figure("pic/9-page-1.png")
]

#exercise(subname: [6.3])[
  分析图 P6.3 时序电路的逻辑功能，写出驱动方程、状态方程和输出方程，画出状态转换图，并说明能否自启动。
]
#solution[
  由电路读出各 JK 触发器的激励端，再用
  $
    Q^+=J Q'+K'Q
  $
  写出状态方程。输出为 $Y=Q_3$，属于 Moore 型电路；无效状态能够进入有效循环，因此可以自启动。完整驱动方程和状态图保留如下。
  #hw-figure("pic/9-page-2.png")
]

#exercise(subname: [6.14])[
  用 4 位同步二进制计数器 74LS161 接成十二进制计数器，标出输入、输出端，可以附加必要门电路。
]
#solution[
  采用反馈置数法：检测终端状态后使同步置数端有效，从而把 16 个自然状态压缩为 12 个计数状态。接线及锁存反馈如下。
  #hw-figure("pic/9-page-3.png")
]

#exercise(subname: [6.15])[
  图 P6.15 是可变进制计数器。分析控制变量 $A=1$ 和 $A=0$ 时电路分别为几进制计数器。
]
#solution[
  根据反馈门所检测的终端状态：
  $
    A=1: quad 1011 -> 0000,
  $
  因而为十二进制计数器；
  $
    A=0: quad 1001 -> 0000,
  $
  因而为十进制计数器。原电路分析如下。
  #hw-figure("pic/9-page-4.png")
]

#exercise(subname: [6.29])[
  设计一个序列信号发生器，使其在一系列 CLK 信号作用下周期性输出序列“0010110111”。
]
#solution[
  用 74LS161 产生地址，74HC151 作数据选择器；把十位序列依次接到数据输入端，并用计数器反馈限定为十个地址状态。原真值表与接线如下。
  #hw-figure("pic/9-page-5.png")
]

#exercise(subname: [6.33])[
  用 D 触发器和门电路设计一个十一进制计数器，并检查电路能否自启动。
]
#solution[
  采用四位状态编码，令有效循环为
  $
    0000 -> 0001 -> 0010 -> dots -> 1010 -> 0000.
  $
  对状态表作卡诺图化简后得到四个 $D_i=Q_i^+$ 的驱动方程。无效状态均能返回有效循环，故电路可以自启动。状态图、卡诺图和最终门电路如下。
  #hw-figure("pic/9-page-6.png")
  #hw-figure("pic/9-page-7.png")
  #hw-figure("pic/9-page-8.png")
]

#exercise(subname: [补充 1])[
  在已有 T 触发器同步计数器基础上修改驱动方程，把加法计数器改成十二进制，并完善状态转换图。
]
#solution[
  基本低位激励保持
  $
    T_0=1, quad T_1=Q_0,
  $
  高位激励在终端状态附近加入反馈限制，使 $1011$ 后回到 $0000$。修改后的方程和状态图如下。
  #hw-figure("pic/9-page-9.png")
]

#exercise(subname: [补充 2])[
  用 D 触发器设计一个串行二进制数被 3 整除的判别电路。
]
#solution[
  以当前余数 $0,1,2$ 作为三个状态。读入一位 $X$ 后，新余数满足
  $
    r^+=(2r+X) mod 3.
  $
  状态图和卡诺图化简给出相应的 $D_0$、$D_1$ 与输出 $Y$；当新余数为 0 时输出 1。原设计与门电路如下。
  #hw-figure("pic/9-page-10.png")
  #hw-figure("pic/9-page-11.png")
]
