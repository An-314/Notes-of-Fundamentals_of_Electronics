#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第11次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [7.4])[
  图 P7.4 是用 CMOS 反相器接成的压控施密特触发电路。分析转换电平 $V_(T+)$、$V_(T-)$ 以及回差电压 $Delta V_T$ 与控制电压 $V_(C O)$ 的关系。

  #hw-figure("pic/11-p7.4.jpg", width: 55%)
]

#solution[
  设反相器阈值为 $V_(T H)$。对公共输入节点列节点方程，并分别取输出低、高电平，可得
  $
    V_(T+)=V_(T H)(1+R_1/R_2+R_1/R_3)-R_1/R_3 V_(C O),
  $
  $
    V_(T-)=V_(T H)(1+R_1/R_2+R_1/R_3)
      -R_1/R_2 V_(D D)-R_1/R_3 V_(C O).
  $
  因而
  $
    Delta V_T=V_(T+)-V_(T-)=R_1/R_2 V_(D D).
  $
  $V_(C O)$ 只使两个转换电平以斜率 $-R_1/R_3$ 同向移动，不改变回差宽度。
]

#exercise(subname: [7.7])[
  微分型单稳态电路中，$R=51 "k" Omega$、$C=0.01 mu "F"$、$V_(D D)=10 "V"$。求输出脉冲的宽度和幅度。

  #hw-figure("pic/11-p7.7.jpg", width: 72%)
]

#solution[
  $
    t_w=R C ln 2
      =51 "k" Omega times 0.01 mu "F" times ln 2
      approx 0.353 "ms".
  $
  输出在 $0$ 与 $V_(D D)$ 之间翻转，故脉冲幅度约为
  $
    V_m=V_(D D)=10 "V".
  $
]

#exercise(subname: [7.13])[
  图 P7.13 为 CMOS 反相器组成的对称式多谐振荡器。已知 $R_(F 1)=R_(F 2)=10 "k" Omega$、$C_1=C_2=0.01 mu "F"$、$R_(P 1)=R_(P 2)=33 "k" Omega$，求振荡频率并画出各点电压波形。

  #hw-figure("pic/11-p7.13.jpg", width: 62%)
]

#solution[
  两级完全对称，每一半周期由反馈电阻和耦合电容决定，因此
  $
    T=2 R_F C ln 3
      =2 times 10 "k" Omega times 0.01 mu "F" times ln 3
      approx 2.20 times 10^(-4) "s",
  $
  $
    f=1/T approx 4.55 "kHz".
  $
  $v_(o 1)$ 与 $v_(o 2)$ 为相位相反的方波，$v_(i 1)$、$v_(i 2)$ 为在阈值之间指数变化并在切换瞬间跃变的波形：

  #hw-figure("pic/11-p7.13-wave.jpg", width: 62%)
]

#exercise(subname: [7.20])[
  图 P7.20 为 555 定时器开机延时电路。已知 $C=25 mu "F"$、$R=91 "k" Omega$、$V_(C C)=12 "V"$，求常闭开关断开后输出跳为高电平所需的延迟时间。

  #hw-figure("pic/11-p7.20.jpg", width: 48%)
]

#solution[
  开关断开后，电容电压由 $V_(C C)$ 经 $R$ 放电；当其降至 $V_(C C)/3$ 时，施密特触发器翻转。因此
  $
    t_d=R C ln 3
      =91 "k" Omega times 25 mu "F" times ln 3
      approx 2.50 "s".
  $
]

#exercise(subname: [7.23])[
  图 P7.23 为 555 定时器构成的压控振荡器。求控制电压 $v_1$ 与振荡频率的关系，并判断 $v_1$ 升高时频率如何变化。

  #hw-figure("pic/11-p7.23.jpg", width: 58%)
]

#solution[
  控制端把上、下转换电平分别设为 $v_1$ 与 $v_1/2$。电容充电和放电时间分别为
  $
    t_H=(R_1+R_2) C ln ((V_(C C)-v_1/2)/(V_(C C)-v_1)),
  $
  $
    t_L=R_2 C ln (v_1/(v_1/2))=R_2 C ln 2.
  $
  故
  $
    f(v_1)=1/((R_1+R_2) C ln ((V_(C C)-v_1/2)/(V_(C C)-v_1))+R_2 C ln 2).
  $
  在 $0<v_1<V_(C C)$ 的工作范围内，$v_1$ 升高使充电时间增大，因而振荡频率降低。
]

#exercise(subname: [7.26])[
  图 P7.26 为救护车扬声器发音电路。按图示参数计算高、低音频率及其持续时间。取 $V_(C C)=12 "V"$，555 输出高、低电平为 $11 "V"$ 与 $0.2 "V"$。

  #hw-figure("pic/11-p7.26.jpg", width: 75%)
]

#solution[
  左侧 555 产生缓慢方波。其高、低电平持续时间为
  $
    t_(1 H)=(R_1+R_2) C_1 ln 2 approx 1.11 "s",
  $
  $
    t_(1 L)=R_2 C_1 ln 2 approx 1.04 "s".
  $
  它经 $R_3$ 改变右侧 555 的控制阈值。按输出高、低电平和内部三只等值分压电阻计算，控制电平较高时有 $V_(T+) approx 8.8 "V"$，右侧周期约为
  $
    T_(2,"low") approx 1.63 "ms", quad f_("low") approx 611 "Hz".
  $
  控制电平较低时 $V_(T+) approx 6.0 "V"$，右侧周期约为
  $
    T_(2,"high") approx 1.14 "ms", quad f_("high") approx 876 "Hz".
  $
  因而低音约持续 $1.11 "s"$，高音约持续 $1.04 "s"$，两者交替出现。
]
