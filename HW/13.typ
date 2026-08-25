#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第13次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [2.9])[
  求图 P2.9 各电路输出电压与输入电压的运算关系。

  #hw-figure("pic/13-p2.9.png", width: 88%)
]

#solution[
  利用理想运放的虚短、虚断条件，可得：
  $
    "(a)" quad u_o=-R_f/R_1 u_(i 1)-R_f/R_2 u_(i 2)
      =-4u_(i 1)-2u_(i 2).
  $
  （b）同相端的电压为 $(u_(i 1)+2u_(i 2))/3$，闭环增益为 $1+R_f/R_3=6$，故
  $
    u_o=2u_(i 1)+4u_(i 2).
  $
  （c）同相端电压为 $u_(i 3)$，噪声增益为 $1+2+2=5$，故
  $
    u_o=5u_(i 3)-2u_(i 1)-2u_(i 2).
  $
  （d）同相端是 $u_(i 3)$、$u_(i 4)$ 的电阻加权平均，结合噪声增益 $21$，得到
  $
    u_o=20u_(i 3)+u_(i 4)-10u_(i 1)-10u_(i 2).
  $
]

#exercise(subname: [2.11])[
  求图 P2.11 电路输出电压与输入电压的运算关系。

  #hw-figure("pic/13-p2.11.jpg", width: 72%)
]

#solution[
  深度负反馈使 $A_1$ 两输入端等电位，即求和节点电压等于 $u_(i 2)$。理想运放输入电流为零，故流过 $R_1$ 的电流全部流经负载 $R_L$：
  $
    (u_(i 1)-u_(i 2))/R_1=u_o/R_L.
  $
  因而
  $
    u_o=R_L/R_1 (u_(i 1)-u_(i 2)).
  $
]

#exercise(subname: [2.17])[
  图 P2.17 中运放输出最大值为 $plus.minus 12 "V"$，输入为图示方波，且 $t=0$ 时 $u_(o 1)=0$。画出 $u_(o 1)$ 与 $u_(o 2)$ 的波形。

  #hw-figure("pic/13-p2.17.jpg", width: 88%)
]

#solution[
  第一级为反相积分器，$R C=100 "k" Omega times 0.1 mu "F"=10 "ms"$，因此
  $
    (dif u_(o 1))/(dif t)=-u_i/(R C).
  $
  当 $u_i=plus.minus 5 "V"$ 时，斜率为 $minus.plus 0.5 "V/ms"$。由 $u_(o 1)(0)=0$ 可得三角波依次经过
  $
    (0,0), (10,-5), (30,5), (50,-5), (70,5), dots.
  $

  第二级为滞回比较器。翻转条件为
  $
    u_(o 1)/R_1+u_(o 2)/R_2=0,
  $
  故阈值为 $plus.minus (R_1/R_2)12 "V"=plus.minus 4 "V"$。输出 $u_(o 2)$ 在 $plus.minus 12 "V"$ 间翻转。波形如下：

  #hw-figure("pic/13-p2.17-wave.png", width: 78%)
]

#exercise(subname: [8.8])[
  分析图 P8.8 的工作原理，并画出输出电压 $v_o$ 的波形。RAM 数据及电路连接见图。

  #hw-figure("pic/13-p8.8.png", width: 82%)
]

#solution[
  74HC160 是十进制计数器，地址 $A_3 A_2 A_1 A_0$ 按 $0000$ 至 $1001$ 周期变化。RAM 对应输出的四位数据依次为
  $
    0,1,3,7,15,15,7,3,1,0.
  $
  这四位数据接到 AD7520 的高四位输入；取 $V_(R E F)=-8 "V"$，反相电流—电压转换后
  $
    v_o=8 "V" times D/16=D/2 "V".
  $
  因此每个计数周期的输出电平序列为
  $
    0,0.5,1.5,3.5,7.5,7.5,3.5,1.5,0.5,0 quad "V",
  $
  随后重复，形成阶梯状的离散波形：

  #hw-figure("pic/13-p8.8-wave.png", width: 82%)
]
