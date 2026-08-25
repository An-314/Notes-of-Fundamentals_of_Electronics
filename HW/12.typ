#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第12次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [6.3])[
  对图 P6.3 的两个两级放大电路，判断级间耦合方式与各级基本接法，并写出交流电压增益、输入电阻和输出电阻的表达式。所有电容对交流均视为短路。

  #hw-figure("pic/12-p6.3.jpg", width: 94%)
]

#solution[
  （a）为直接耦合，两级均为共射极。令 $R_(c 1)^'=R_(c 1) parallel r_(b e 2)$，则近似有
  $
    A_u=(-beta_1 R_(c 1)^'/r_(b e 1))
        (-beta_2 (R_(c 2) parallel R_L)/r_(b e 2)),
  $
  $
    R_i=R_(b 1) parallel R_(b 2) parallel r_(b e 1),
    quad R_o approx R_(c 2).
  $

  （b）为阻容耦合；第一级为共源极，第二级为共射极。忽略晶体管输出电阻时
  $
    A_u=(-g_m (R_d parallel R_b parallel r_(b e)))
        (-beta (R_c parallel R_L)/r_(b e)),
  $
  $
    R_i approx R_(g 3)+(R_(g 1) parallel R_(g 2)),
    quad R_o approx R_c.
  $
  两级各反相一次，所以总电压增益为正。
]

#exercise(subname: [6.7])[
  图 P6.7 的差分电路参数理想对称，$beta_1=beta_2=150$、$r_(b b)^'=200 Omega$、$U_(B E)=0.7 "V"$。求静态工作点、差模与共模增益，并求 $u_(i d)=10 "mV"$ 时的输出。

  #hw-figure("pic/12-p6.7.jpg", width: 48%)
]

#solution[
  两管基极为零电位，公共发射极约为 $-0.7 "V"$，故
  $
    I_(C Q) approx (12-0.7 "V")/(2 times 10 "k" Omega)
      =0.565 "mA".
  $
  $
    U_(C E Q)=12 "V"-I_(C Q) 5.1 "k" Omega+0.7 "V"
      approx 9.82 "V".
  $
  小信号输入电阻
  $
    r_(b e)=r_(b b)^'+(1+beta) U_T/I_(E Q) approx 7.14 "k" Omega.
  $
  双端输出差模增益与共模增益近似为
  $
    A_d=-beta R_c/r_(b e) approx -108, quad A_c=0.
  $
  因此
  $
    u_o=A_d u_(i d)=-1.08 "V".
  $
]

#exercise(subname: [6.8])[
  图 P6.8 中两管 $beta=200$、$r_(b b)^'=300 Omega$、$U_(B E)=0.7 "V"$，输入直流信号 $u_(i 1)=10 "mV"$、$u_(i 2)=30 "mV"$。求静态量、共模和差模输入、增益及输出动态电压。

  #hw-figure("pic/12-p6.8.jpg", width: 44%)
]

#solution[
  静态时两管近似均分尾电流：
  $
    I_(C Q) approx (6-0.7 "V")/(2 times 5.1 "k" Omega)
      approx 0.52 "mA".
  $
  因而 $U_(C 1) approx 12-0.52 times 10=6.8 "V"$，而未接集电极电阻的一侧 $U_(C 2)=12 "V"$。

  输入分解为
  $
    u_(i c)=(u_(i 1)+u_(i 2))/2=20 "mV",
    quad u_(i d)=u_(i 1)-u_(i 2)=-20 "mV".
  $
  由 $r_(b e) approx 10.35 "k" Omega$ 得
  $
    A_d=-beta R_c/(2 r_(b e)) approx -96.6,
    quad A_c approx -0.97.
  $
  所以
  $
    Delta u_o=A_d u_(i d)+A_c u_(i c)
      approx 1.91 "V".
  $
  对应集电极总电位约为 $6.8+1.91=8.71 "V"$。
]

#exercise(subname: [6.11])[
  判断图 P6.11 中哪些接法能够构成复合管，说明等效管类型并标出等效管脚。

  #hw-figure("pic/12-p6.11.png", width: 86%)
]

#solution[
  判据是两只管的电流方向必须相容，且前管输出电流能够作为后管的输入电流。图中只有（c）和（d）满足条件：

  - （c）等效为 NPN 管，左端为 $b$，右上端为 $c$，右下端为 $e$；
  - （d）等效为 PNP 管，左端为 $b$，右上端为 $e$，右下端为 $c$。

  （a）、（b）、（e）、（f）的极性或电流连接关系不满足复合管条件。
]

#exercise(subname: [7.4])[
  判断图 P7.4 各电路是否引入反馈；若有，说明直流或交流、正或负、局部或级间反馈，并指出反馈网络。所有电容对交流均视为短路。

  #hw-figure("pic/12-p7.4a-d.png", width: 82%)
  #hw-figure("pic/12-p7.4e-f.png", width: 82%)
]

#solution[
  各电路的判断如下：

  - （a）没有形成闭合反馈通路，不构成反馈；
  - （b）通过 $R_1,R_2$ 构成直流负反馈；
  - （c）通过 $R_2,R_3$ 构成交流负反馈，耦合电容隔断直流；
  - （d）通过 $R_1,R_2,C$ 同时构成直流和交流负反馈；
  - （e）通过 $R_1,R_2$ 构成直流、交流正反馈，属于级间反馈；
  - （f）有两个负反馈环：外环经 $R_1,R_2$ 构成直流、交流级间反馈，$R_4$ 构成第二级的直流、交流局部反馈。
]
