#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第7次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [3.5])[
  已知 CMOS 门电路的电源电压 $V_(D D)=5 "V"$，静态电源电流 $I_(D D)=2 "mu A"$，输入信号为 $200 "kHz"$ 的方波，负载电容 $C_L=200 "pF"$，功耗电容 $C_(p d)=20 "pF"$。计算静态功耗、动态功耗、总功耗和电源平均电流。
]

#solution[
  静态功耗为
  $
    P_S=V_(D D)I_(D D)=5 times 2 "mu W"=10 "mu W".
  $
  动态功耗为
  $
    P_D=(C_L+C_(p d))f V_(D D)^2
      =220 "pF" times 200 "kHz" times (5 "V")^2
      =1.10 "mW".
  $
  因而
  $
    P=P_S+P_D=1.11 "mW", quad
    bar(I)_(D D)=P/V_(D D)=0.222 "mA".
  $
]

#exercise(subname: [3.7])[
  分析图 P3.7 中各 CMOS 电路的逻辑功能，写出输出逻辑函数式。

  #hw-figure("pic/7-p3.7.jpg")
]

#solution[
  根据互补 MOS 管网络的串并联关系可得
  $
    Y_a=A'B'C', quad Y_b=(A'+B'+C')'=A B C.
  $
]

#exercise(subname: [3.10])[
  图 P3.10 中 $G_1$ 至 $G_4$ 是 OD 输出结构的与非门 74HC03，并接成线与结构。写出输出 $Y$ 与八个输入之间的逻辑关系，并计算外接电阻 $R_L$ 的允许范围。

  #hw-figure("pic/7-p3.10.jpg")
]

#solution[
  四个 OD 输出只有全部为高阻态时，公共输出才被电阻拉高。因此
  $
    Y=(A_1 A_2)'(B_1 B_2)'(C_1 C_2)'(D_1 D_2)'
  $
  $
    quad =(A_1 A_2+B_1 B_2+C_1 C_2+D_1 D_2)'.
  $
  由高电平漏电流限制求得上限，由低电平灌电流限制求得下限。代入题给数据，
  $
    R_(L min) approx 899.8 Omega, quad R_(L max)=20 "k" Omega.
  $
  故
  $
    899.8 Omega <= R_L <= 20 "k" Omega.
  $
]

#exercise(subname: [3.12])[
  说明图 P3.12 中各门电路的输出是高电平还是低电平。已知它们都是 74HC 系列 CMOS 电路。

  #hw-figure("pic/7-p3.12.jpg")
]

#solution[
  CMOS 输入端电流近似为零，并结合各门的逻辑关系判断，结果依次为
  $
    Y_1="高电平", quad Y_2="高电平", quad
    Y_3="低电平", quad Y_4="低电平".
  $
]

#exercise(subname: [3.15])[
  将图 P3.13 中的门电路改为 CMOS 与非门，说明当另一输入端处于题 3.13 所给五种状态时，用万用表测得的悬空输入端电压各为多少。
]

#solution[
  CMOS 输入电流近似为零，万用表在 $5 "V"$ 量程下的内阻为
  $
    20 "k" Omega/"V" times 5 "V"=100 "k" Omega.
  $
  因此万用表本身把被测悬空输入端等效接地。另一输入端的五种状态不改变这一结论，五种情况下均有
  $
    v_(I 2) approx 0 "V".
  $
]

#exercise(subname: [4.5])[
  用与非门设计四变量多数表决电路。当 $A,B,C,D$ 中有三个或三个以上为 1 时输出为 1，否则输出为 0。
]

#solution[
  输出为 1 的四个三变量乘积项为
  $
    Y=A B C+A B D+A C D+B C D.
  $
  化为与非-与非形式：
  $
    Y=((A B C)'(A B D)'(A C D)'(B C D)')'.
  $
  原手绘电路如下。
  #hw-figure("pic/7-p4.5.jpg", width: 60%)
]

#exercise(subname: [4.6])[
  水箱由大、小两台水泵 $M_L$、$M_S$ 供水，并设有水位检测元件 $A,B,C$。水面低于检测元件时输出高电平，高于检测元件时输出低电平。按题给四种水位要求设计尽量简单的控制电路。

  #hw-figure("pic/7-p4.6.jpg", width: 58%)
]

#solution[
  对实际可能出现的水位状态列真值表，并把其余组合视为无关项，化简得到
  $
    M_S=A+B'C, quad M_L=B.
  $
  即大水泵直接由检测信号 $B$ 控制，小水泵由 $A$ 与 $B'C$ 的或逻辑控制。
]

#exercise(subname: [补充])[
  不考虑缓冲级，用尽量少的 MOS 管实现题面给出的两个逻辑网络，并分别画出指定的下拉、上拉网络。
]

#solution[
  第一个函数化简为
  $
    F_1=A'B'+D'.
  $
  第二个函数的互补形式为
  $
    F_2'=A B+C D+B D.
  $
  原手绘晶体管网络保留如下。
  #hw-figure("pic/7-mos.png")
]
