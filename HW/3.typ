#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第3次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 88%) = align(center, image(path, width: width))

#exercise(subname: [4.12])[
  电路如图 P4.12 所示，已知晶体管的 $U_(B E)=0.7 "V"$、$beta=300$、$r_(b b')=200 Omega$。

  （1）当开关 $S$ 位于 1 位置时，求静态工作点 $I_(B Q)$、$I_(C Q)$ 和 $U_(C E Q)$。

  （2）分别求开关 $S$ 位于 1、2、3 位置时的电压放大倍数 $dot(A)_u$，比较这三个电压放大倍数，并说明发射极电阻如何影响电压放大倍数。

  #hw-figure("pic/3-p4.12.png", width: 80%)
]

#solution[
  直流分析时各电容开路，三个开关位置对应的静态电路相同。忽略分压电路的负载效应，
  $
    U_(B Q)=R_(b 2)/(R_(b 1)+R_(b 2)) V_(C C)
      =10/(50+10) dot 12 "V"=2 "V".
  $
  因而
  $
    I_(E Q)=(U_(B Q)-U_(B E))/(R_(e 1)+R_(e 2))
      =1.3 "V"/(1.1 "k" Omega)
      approx 1.182 "mA".
  $
  取 $I_(C Q) approx I_(E Q)$，得到
  $
    I_(C Q) approx 1.182 "mA", quad
    I_(B Q)=I_(C Q)/beta approx 3.94 "mu A",
  $
  $
    U_(C E Q)=V_(C C)-I_(C Q)R_c-I_(E Q)(R_(e 1)+R_(e 2))
      approx 7.15 "V".
  $

  晶体管的动态输入电阻为
  $
    r_(b e)=r_(b b')+(1+beta) U_T/I_(E Q)
      approx 6.799 "k" Omega.
  $
  负载与集电极电阻的并联值为
  $
    R_c parallel R_L=3 "k" Omega parallel 3 "k" Omega=1.5 "k" Omega.
  $
  三个位置对应的未旁路发射极电阻依次为
  $
    R_e=1.1 "k" Omega, quad 100 Omega, quad 0.
  $
  电压放大倍数为
  $
    dot(A)_u=-beta(R_c parallel R_L)/(r_(b e)+(1+beta)R_e).
  $
  代入数值得
  $
    dot(A)_(u 1) approx -1.332, quad
    dot(A)_(u 2) approx -12.20, quad
    dot(A)_(u 3) approx -66.19.
  $
  可见，未旁路的发射极电阻越小，负反馈越弱，电压放大倍数的绝对值越大。
]

#exercise(subname: [4.14])[
  电路如图 P4.14 所示，已知晶体管的 $U_(B E)=0.7 "V"$、$beta=200$、$r_(b b')=100 Omega$。

  （1）求静态工作点 $I_(B Q)$、$I_(C Q)$ 和 $U_(C E Q)$；（2）求 $dot(A)_u$、$R_i$、$R_o$；（3）说明该电路的组态及特点；（4）为了增大 $dot(A)_u$，应如何调整 $R_c$ 或 $R_e$，并保证电路始终处于放大状态；（5）电容 $C_b$ 开路时，$dot(A)_u$、$R_i$、$R_o$ 如何变化？

  #hw-figure("pic/3-p4.14.png")
]

#solution[
  直流时电容开路。由分压偏置得
  $
    U_(B Q)=25/(50+25) dot 12 "V"=4 "V",
  $
  $
    U_(E Q)=U_(B Q)-U_(B E)=3.3 "V".
  $
  因而
  $
    I_(E Q)=U_(E Q)/R_e=3.3 "mA", quad
    I_(C Q) approx 3.3 "mA",
  $
  $
    I_(B Q)=I_(C Q)/beta=16.5 "mu A",
  $
  $
    U_(C E Q)=12 "V"-I_(C Q)R_c-U_(E Q)=2.1 "V".
  $

  按原解答取 $r_(b e) approx 1.776 "k" Omega$。交流时 $C_b$ 将基极旁路为交流地，电路为共基极放大电路。因此
  $
    dot(A)_u=beta(R_c parallel R_L)/r_(b e)
      approx (200 times 1 "k" Omega)/(1.776 "k" Omega)
      approx 112.6,
  $
  $
    R_i=R_e parallel r_(b e)/(1+beta) approx 8.8 Omega,
    quad R_o approx R_c=2 "k" Omega.
  $

  共基极电路的电压增益为正，输入电阻很小、输出电阻较大，电流增益接近 1，适合低阻信号源及高频应用。

  为增大电压增益，可以适当增大 $R_c$；也可以减小 $R_e$，使静态电流增大、$r_(b e)$ 减小。但调整后必须重新检查 $U_(C E Q)$，保证晶体管仍处于放大区。

  当 $C_b$ 开路时，基极不再理想交流接地，偏置电阻网络参与交流反馈。因此 $R_i$ 增大、$dot(A)_u$ 减小，而忽略晶体管输出电阻时 $R_o$ 基本不变。
]

#exercise(subname: [补充])[
  对图示共基极放大电路写出静态工作点、交流电压增益、输入电阻和输出电阻的一般表达式。

  #hw-figure("pic/3-common-base.png", width: 70%)
]

#solution[
  设基极分压电阻为 $R_2$、$R_3$，发射极电阻为 $R_1$，集电极电阻为 $R_4$。忽略基极电流对分压网络的影响，有
  $
    U_(B Q)=R_2/(R_2+R_3)V_(C C), quad
    U_(E Q)=U_(B Q)-U_(B E Q),
  $
  $
    I_(E Q)=U_(E Q)/R_1 approx I_(C Q), quad
    I_(B Q)=I_(E Q)/beta.
  $
  静态管压降为
  $
    U_(C E Q)=V_(C C)-R_4 I_(C Q)-U_(E Q).
  $
  基极被电容旁路为交流地时，
  $
    dot(A)_u=beta R_4/r_(b e), quad
    R_i=R_1 parallel r_(b e)/(1+beta), quad
    R_o approx R_4.
  $
]
