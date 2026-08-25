#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第14次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [2.13])[
  分别求图 P2.13 各电路的运算关系。

  #hw-figure("pic/14-p2.13.png", width: 88%)
]

#solution[
  （a）反馈支路阻抗为 $R_2+1/(s C)$，故
  $
    u_o=-R_2/R_1 u_i-1/(R_1 C) integral u_i dif t
      =-u_i-10^3 integral u_i dif t.
  $

  （b）由虚短和电容电流关系可得
  $
    u_o=u_i+1/(R C) integral u_i dif t
      =u_i+10^3 integral u_i dif t.
  $

  （c）设两个输入端的公共电位为 $u$。分别对两节点列电流方程并消去 $u$，得到
  $
    u_o=1/(R C) integral u_i dif t
      =10^3 integral u_i dif t.
  $

  （d）为反相加法积分器：
  $
    u_o=-1/C integral (u_(i 1)/R_1+u_(i 2)/R_2) dif t
      =-10^4 integral u_(i 1) dif t-5 times 10^3 integral u_(i 2) dif t.
  $
]

#exercise(subname: [2.14])[
  图 P2.14 中电容初始电压为零。（1）求 $A_2$ 输出 $u_(o 2)$ 与 $A_1$ 输出 $u_o$ 的关系；（2）求 $u_o$ 与 $u_i$ 的关系；（3）开关在 $t=0$ 位于位置 1，$t=2 "s"$ 转到位置 2，$t=4 "s"$ 回到位置 1，画出 $u_o$ 并求过零时刻。

  #hw-figure("pic/14-p2.14.jpg", width: 62%)
]

#solution[
  $A_2$ 是同相放大器，所以
  $
    u_(o 2)=(1+R_2/R_3)u_o=(1+180/20)u_o=10u_o.
  $
  对 $A_1$ 的反相端列电流方程：
  $
    u_i/R_1=-C (dif u_(o 2))/(dif t)=-10C (dif u_o)/(dif t).
  $
  因而
  $
    u_o=-1/(10R_1 C) integral u_i dif t
      =-100 integral u_i dif t.
  $
  在 $0$ 至 $2 "s"$，$u_i=2 "V"$，斜率为 $-200 "V/s"$；在 $2$ 至 $4 "s"$，$u_i=-3 "V"$，斜率为 $300 "V/s"$；此后斜率重新变为 $-200 "V/s"$。于是
  $
    u_o(t)=cases(
      -200t, & 0<=t<2,
      -400+300(t-2), & 2<=t<4,
      200-200(t-4), & t>=4
    ) "V".
  $
  除 $t=0$ 外，过零时刻为
  $
    t=10/3 "s" approx 3.33 "s", quad t=5 "s".
  $
  原手稿把纵轴按 $10^2 "V"$ 缩放，因而标成 $-4$ 与 $2$；波形形状和过零时刻相同。

  #hw-figure("pic/14-p2.14-wave.png", width: 62%)
]

#exercise(subname: [8.2])[
  图 P8.2 中运放理想且 $u_i>0$，求 $u_o$ 与 $u_i$ 的关系。

  #hw-figure("pic/14-p8.2.jpg", width: 42%)
]

#solution[
  反相端为虚地，输入电流为 $u_i/R$，且全部流过二极管。二极管电压 $u_D=-u_o$，故
  $
    u_i/R=I_S exp(-u_o/U_T).
  $
  因而该电路是对数运算器：
  $
    u_o=-U_T ln (u_i/(R I_S)).
  $
]

#exercise(subname: [8.6])[
  图 P8.6 为有效值检测电路。运放和模拟乘法器均理想，电容初始电压为零，求 $u_o$ 与 $u_i$ 的关系。

  #hw-figure("pic/14-p8.6.jpg", width: 74%)
]

#solution[
  左侧乘法器输出 $k u_i^2$，经积分器后
  $
    u_(o 1)=-1/(R C) integral k u_i^2 dif t.
  $
  右侧运放与乘法器构成平方根反馈环，满足
  $
    k u_o^2=-u_(o 1).
  $
  因此取正根得到
  $
    u_o=sqrt(1/(R C) integral u_i^2 dif t).
  $
  选择积分时间常数为测量窗口时，该式即输入信号的有效值。
]

#exercise(subname: [8.8])[
  推导图 P8.8 两电路的电压放大倍数，并说明滤波器类型与阶数。

  #hw-figure("pic/14-p8.8.jpg", width: 78%)
]

#solution[
  运放均接成电压跟随器，因此传递函数由输入端的 RC 网络决定。

  （a）输出取在电阻两端：
  $
    A_u(j omega)=(j omega R C)/(1+j omega R C).
  $
  低频时趋于零，高频时趋于一，是一阶高通滤波器。

  （b）输出取在电容两端：
  $
    A_u(j omega)=1/(1+j omega R C).
  $
  低频时趋于一，高频时趋于零，是一阶低通滤波器。两者的截止角频率均为 $omega_c=1/(R C)$。
]
