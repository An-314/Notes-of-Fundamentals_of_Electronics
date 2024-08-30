#import "@local/mytemplate:1.0.0": *
#import "@preview/physica:0.9.2": *

= 半导体基础知识
== 半导体二极管和晶体管 semiconductor materials
=== 本征半导体

导电性介于导体与绝缘体之间的物质称为半导体。硅（Si）、锗（Ge），均为四价元素，它们原子的最外层电子受原子核的束缚力介于导体与绝缘体之间。

本征半导体是*纯净的晶体结构*的半导体。

#figure(
  image("pic/2024-02-29-08-08-35.png", width: 80%),
  caption: [
    本征半导体结构
  ],
)

- 载流子：运载电荷的粒子——自由电子、空穴。本征半导体中的电流是两种载流子电流之和。
- 复合：自由电子与空穴相遇，互相消失。 
- 随着*温度*的升高，本征半导体的导电性会增强。

=== 杂质半导体

杂质半导体主要靠多数载流子导电。*掺入杂质*越多，多子浓度越高，导电性越强，实现
导电性可控。

还是两种载流子，但是多数载流子的浓度远远大于少数载流子。
==== N型半导体

在本征半导体中加入少量五价元素，如磷（P）、砷（As）等，称为N型半导体。

#figure(
  image("pic/2024-02-29-08-14-26.png", width: 30%),
  caption: [
    N型半导体结构
  ],
)

此时空穴比未加杂质时的数目少。
==== P型半导体

在本征半导体中加入少量三价元素，如硼（B）、铝（Al）等，称为P型半导体。

#figure(
  image("pic/2024-02-29-08-17-52.png", width: 30%),
  caption: [
    P型半导体结构
  ],
)

在杂质半导体中，温度变化时，载流子的数目也会发生变化。少子与多子变化的数目相同。多数载流子与少数载流子的浓度变化，少数载流子更明显。
=== PN结的形成及其单向导电性
==== PN结的形成
#figure(
  image("pic/2024-02-29-08-23-39.png", width: 80%),
  caption: [
    PN结的形成
  ],
)

扩散运动使靠近接触面P区的空穴浓度降低、靠近接触面N区的自由电子浓度降低（浓度梯形变化），产生内电场。该电场阻碍了多数载流子的*扩散运动*，有利于少数载流子的*漂移运动*。最终达到动态平衡，形成*PN结*。

#figure(
  image("pic/2024-02-29-08-31-50.png", width: 40%),
  caption: [
    形成空间电荷区
  ],
)

=== PN结的单向导电性

#figure(
  image("pic/2024-02-29-08-34-06.png", width: 80%),
  caption: [
    PN结的单向导电性
  ],
)

正向需要*开启电压*，来克服PN结的内电场，使得多数载流子能够通过PN结。反向时，内电场增强，阻碍多数载流子通过PN结，使得电流几乎为0。

- *PN结加正向电压导通*：耗尽层变窄，扩散运动加剧，由于外电源的作用，形成扩散电流，PN结处于导通状态。
- *PN结加反向电压截止*：耗尽层变宽，阻止扩散运动，有利于漂移运动，形成漂移电流。由于电流很小，故可近似认为其截止。
=== PN结的电容效应
==== 势垒电容

PN结外加电压变化时， *空间电荷区的宽度*将发生变化，有电荷的积累和释放的过程，与电容的充放电相同，其等效电容称为势垒电容$C_b$。
==== 扩散电容

PN结外加的正向电压变化时，在扩散路程中*载流子的浓度及其梯度*均有变化，也有电荷的积累和释放的过程，其等效电容称为扩散电容$C_d$。
==== 结电容

一个PN结的等效电容$C_j$由势垒电容和扩散电容组成。*结电容*不是常量。
$
C_j = C_b + C_d
$

一个PN结可以看作一个电容（直流时候不考虑）和一个可变电阻的并联（但还有个开启电压）。直流情况下，该电容不起作用；若PN结外加电压频率高到一定程度，则*失去单向导电性*。

== 半导体二极管及其基本应用
=== 二极管的组成

将PN结封装，引出两个电极，就构成了二极管。

#grid(
  columns: (1fr, 3fr),
  align(center)[
    #figure(
      image("pic/2024-02-29-08-45-42.png", width: 80%),
      caption: [
        二极管
      ],
    )
    #figure(
      image("pic/2024-02-29-08-47-05.png", width: 80%),
      caption: [
        四种二极管
      ],
    )
  ],
  align(center)[
    #figure(
      image("pic/2024-02-29-08-46-21.png", width: 80%),
      caption: [
        二极管的分类#footnote[螺丝帽：用来固定和散热。]
      ],
    )
  ]
)

=== 二极管的伏安特性及电流方程

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      image("pic/2024-02-29-08-56-02.png", width: 80%),
      caption: [
        二极管的伏安特性
      ],
    )
    电阻：限流并便于测量。
  ],
  [
    #figure(
      image("pic/2024-02-29-09-34-39.png", width: 70%),
      caption: [
        二极管的电流方程
      ],
    )
  ]
)

- 开启电压：需要克服PN结的内电场，使得少数载流子能够通过PN结
- 反向电流：等效一个微弱的恒流源，内阻无穷大。
- 击穿#footnote[两种击穿：
- 雪崩击穿：当外加电压超过了器件的临界击穿电压时，少数载流子（电子或空穴）在PN结的耗尽区获得足够的能量，以至于它们在撞击晶格时能够敲击出更多的电子-空穴对。
- 齐纳击穿：齐纳击穿也是一种在高电压下发生的击穿机制，但它主要发生在高掺杂浓度的PN结二极管中。在齐纳击穿中，当电场强度足够高时，电场可以直接将价带中的电子“拉”到导带中，通过量子力学中的隧穿效应产生大量的电子-空穴对。]
  电压：当外加电压超过了器件的临界击穿电压时，PN结的内电场被击穿，电流急剧增大。

$
i = I_s (e^(u/U_T) - 1)
$
常温下，$U_T = 26"mV"$。

#align(center)[
  #table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [材料],[开启电压],[导通电压],[反向饱和电流],
  "硅Si", $0.5V$, $0.5~0.8V$ ,$1"µA以下"$,
  "锗Ge", $0.1V$ ,$0.1~0.3V$ ,$"几十µA"$
  
)

]


从二极管的伏安特性可以反映出：
1. 单向导电性

  当正向电压$u >> U_T$，则$i -> I_s e^(u/U_T)$，此时二极管处于导通状态。

  当方向电压$u < 0$，则$i -> -I_s$，此时二极管处于截止状态。

2. 伏安特性受温度影响

  $T（℃）$ ↑→在电流不变情况下管压降$u$↓→反向饱和电流#footnote[温度对少子影响更大]$I_S$↑#footnote[增大1倍/10℃]，$ U_("BR")$ ↓

  $T（℃）$ ↑→正向特性左移，反向特性下移

  #figure(
    image("pic/2024-02-29-09-14-40.png", width: 40%),
    caption: [
      随温度变化的伏安特性
    ],
  )
=== 二极管的等效电路
==== 伏安特性折线化——静态模型（直流）

#figure(
  image("pic/2024-02-29-09-17-06.png", width: 60%),
  caption: [
    选取合适的模型
  ],
)
==== 微变等效电路——动态模型（交流）

有时候传递信息用的是交流的小信号，前面的静态模型无法满足需求。

#figure(
  image("pic/2024-02-29-09-26-40.png", width: 60%),
  caption: [
    小信号模型
  ],
)

当二极管在静态基础上有一动态信号作用时，则可将二极管等效为一个电阻，称为动态电阻，也就是微变等效电路。

根据电流方程，可以计算到动态电阻的值：
$
r_d = U_T / I_S (e^(- u/U_T)) ~ U_T / I_D
$

=== 普通二极管的基本应用
- 整流电路:忽略正向压降和反向电流
    
    将交流电压转换成直流电压，称为整流

    #figure(
      image("pic/2024-03-05-08-22-59.png", width: 80%),
      caption: [
        整流电路
      ],
    )

- 开关电路：二极管导通电压为0.7V

    #figure(
      image("pic/2024-03-05-08-24-17.png", width: 80%),
      caption: [
        与门
      ],
    )

  把二极管反向，并把高电平变成低电平，则成为或门。

=== 稳压二极管

由一个PN结组成，*反向击穿*后在一定的电流范围内端电压基本不变，为稳定电压。

#figure(
  image("pic/2024-03-05-08-28-23.png", width: 50%),
  caption: [
    稳压二极管
  ],
)

==== 主要参数

- 稳定电压$U_Z$
- 稳定电流$I_Z$
- 最大功耗$P_(Z M) = I_(Z M) U_Z$
- 动态电阻$r_z＝ (Δ U_Z) /(Δ I_Z)$

==== 基本电路的组成

电流太小则不稳压，电流太大则会因功耗过大而损坏，因而稳压管电路中必需有限制稳压管电流的限流电阻。

$
I_(D Z min) = I_(R min) - I_L ＞ I_(Z min)\
I_(D Z max) = I_(R max) - I_L＜ I_(Z max)
$
#figure(
  image("pic/2024-03-05-08-33-22.png", width: 20%),
  caption: [
    稳压二极管的基本电路
  ],
)

== 晶体三极管及其基本放大电路

=== 晶体三极管
==== 晶体三极管的结构和符号

#figure(
  image("pic/2024-03-05-08-36-05.png", width: 80%),
  caption: [
    晶体三极管的结构和符号#footnote[箭头：P指向N]
  ],
)


- 发射区高掺杂，基区低掺杂，集电区低掺杂、面积大。

- 发射结正向偏置，集电结反向偏置。

==== 晶体管的放大原理

发射结正偏：利于发射区多子注入，其多子扩散到基区（发射区多子浓度高），变为非平衡少子；只有极少数和空穴复合（因基区薄且多子浓度低）。

极电结反偏：在外电场作用下大部分扩散到基区的电子漂移到集电区（因集电区面积大）。

*扩散运动形成发射极电流$I_E$，复合运动形成基极电流$I_B$，漂移运动形成集电极电流$I_C$。*#footnote[基区扩散电流和少数载流子的运动忽略]

#figure(
  image("pic/2024-03-05-08-55-23.png", width: 80%),
  caption: [
    晶体三极管的放大原理
  ],
)


$
"放大的条件"cases(
  u_(B E) > U_(o n) "发射结正偏",
  u_(C E) >= 0 "即"u_(C E)>=u_(B E) "集电结反偏",
)
$

有电流分配：
$
I_E = I_B + I_C
$
定义：直流电流放大系数
$
overline(beta) = I_C / I_B
$

交流电流放大系数
$
beta = (Δ i_C) / (Δ i_B)
$

以及，如果考虑穿透电流：
$
I_(C E O)#footnote[基极开路集电极回路] = (1 + overline(beta)) I_(C B O)
$
其中$I_(C E O)$是基极开路时的集电极电流，穿透电流；$I_(C B O)$是发射极开路时的集电结反向饱和电流。


==== 晶体管的共射输入特性和输出特性

#figure(
  image("pic/2024-03-05-09-02-41.png", width: 20%),
  caption: [
    晶体管的共射连接
  ],
)
===== 输入特性

#figure(
  image("pic/2024-03-05-09-06-00.png", width: 30%),
  caption: [
    输入特性$i_B = f(U_(B E)) |_(U_(C E))$
  ],
)

- $U_(C E) = 0$时，等同于两个二极管并联；
- $U_(C E) > 0$时，被分流，$I_B$减小；
- 最后会饱和，$I_B$几乎不变。
===== 输出特性

#figure(
  image("pic/2024-03-05-09-10-36.png", width: 70%),
  caption: [
    输出特性$i_C = f(u_(C E)) |_(I_B)$
  ],
)

本质与PN结反向特性一致，非平衡少子的数量不同，导致$I_B$的饱和值不同。

饱和区：流控电流源；放大区：小电阻；截止区：开路#footnote[一般的数字电路工作在饱和区和截止区，模拟电路工作在放大区。]。

$beta$不是一个常数（但在局部的$beta$会比较稳定）。*理想晶体管*就是$beta$不变的晶体管。

#align(center)[
  #table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*工作区*],[*$u_(B E)$*],[*$i_C$*],[*$u_(C E)$*],
  "截止区", [$< U_(o n)$], [$I_(C E O)$],[$V_(C C)$],
  "放大区", [$>= U_(o n)$], [$beta i_B$],[$>= V_(B E)$],
  "饱和区", [$>= U_(o n)$], [$< beta i_B$],[$<= V_(B E)$]
  )
]

===== 温度对晶体管特性的影响

#figure(
  image("pic/2024-03-05-22-51-20.png", width: 60%),
  caption: [
    温度对晶体管特性的影响
  ],
)

$
T (℃) ↑&→I_(C E O) ↑\
&→beta ↑\
&→u_(B E)"不变时" i_B ↑ , i_B "不变时" u_(B E) ↓
$

===== 主要参数
- 直流参数：$overline(beta)$，$overline(alpha)= I_C/I_E$，$I_(C B O)$, $I_(C E O)$
- 交流参数： $β$、 $α=beta/(1 + beta)$、 $f_T$（使$β＝ 1$的信号频率，由于电容，$beta$在频率高时会减少）
- 极限参数： 
  - $I_(C M)$最大集电极电流，$u_(C E)=1"V "$时的$i_C$就是$I_(C M)$
  - $P_(C M)$最大集电极耗散功率， $P_(C M) = i_C u_(C E)$ 
  - $U_((B R) C E O)$ $c-e$间击穿电压

#figure(
  image("pic/2024-03-07-08-17-15.png", width: 50%),
  caption: [
    晶体管的极大参数
  ],
)
=== 放大电路的组成原则
==== 放大的概念

#figure(
  image("pic/2024-03-07-08-22-14.png", width: 80%),
  caption: [
    放大电路
  ],
)


输入信号为零时为静态。

- 放大的信号：*变化量*——常用正弦波作为测试信号
- 放大的本质：能量的控制，利用有源元件实现
- 放大的特征：*功率*放大
- 放大的基本要求：不失真——放大的前提

*放大研究的是动态性能。*


#figure(
  image("pic/2024-03-07-08-31-04.png", width: 80%),
  caption: [ 
    对信号而言，任何放大电路均可看成二端口网络。#footnote[希望$R_i$无穷大、$accent(I_i, dot)$趋于$0$来减少对输入信号的影响。希望$R_O=0$。]
  ],
)

*放大倍数*： 输出量与输入量之比

$
accent(A_(u u), dot) = accent(U_o, dot) / accent(U_i, dot), accent(A_(i i), dot) = accent(I_o, dot) / accent(I_i, dot) , accent(A_(u i), dot) = accent(U_o, dot) / accent(I_i, dot), accent(A_(i u), dot) = accent(I_o, dot) / accent(U_i, dot)
$
后两个称为*互阻*和*互导*。

*输入电阻和输出电阻*：

- 从输入端看进去的等效电阻

    计算
    $
    R_i = U_i / I_i
    $
- 将输出等效成有内阻的电压源，内阻就是输出电阻。

    计算
    $
    R_o = (U_o'-U_o) / (U_O/R_L)
    $

*通频带*：衡量放大电路对不同频率信号的适应能力。

由于电容、电感及半导体元件的电容效应，使放大电路在信号频率较低和较高时电压放大倍数数值下降，并产生相移。

#figure(
  image("pic/2024-03-07-08-44-58.png", width: 80%),
  caption: [
    放大电路的通频带
  ],
)

*最大不失真输出电压$U_(o m)$*： 交流有效值

*最大输出功率和效率*：功率放大电路的主要指标参数
==== 基本共射放大电路的工作原理
===== 电路的组成及各元件的作用

#figure(
  image("pic/2024-03-07-08-55-34.png", width: 50%),
  caption: [
    基本共射放大电路
  ],
)

$T$：有源器件，能够控制能量

$V_(B B)$、$R_b$：使$U_(B E)>U_(o n)$，且有合适的$I_B$，限流

$V_(C C)$：使$U_(C E)≥U_(B E)$，同时作为负载的能源

$R_c$：将$Δ_(i C)$转换成$Δ u_(C E)(u_O)$

$
Delta u_I -> Delta i_B -> Delta i_C -> Delta u_(R_c) -> Delta u_(C E)(u_O)
$

输入电压$u_i$为零时，晶体管各极的电流、$b-e$间的电压、管压降称为静态工作点$Q$#footnote[设置合适的静态工作点，首先要解决失真问题（可能不到开启电压）]，记作$I_(B Q)$、 $I_(C Q)$（$I_(E Q)$）、 $U_(B E Q)$、 $U_(C E Q)$。

要想不失真，就要在信号的整个周期内保证晶体管始终工作在放大区。

#figure(
  image("pic/2024-03-07-09-18-19.png", width: 80%),
  caption: [
    基本共射放大电路的波形分析
  ],
)

#figure(
  image("pic/2024-03-07-09-22-18.png", width: 80%),
  caption: [
    两种失真
  ],
)
==== 组成放大电路
===== 组成原则

- 静态工作点合适：合适的直流电源、合适的电路参数大了的动态信号。
- 对实用放大电路的要求：*共地、直流电源种类尽可能少、负载上无直流分量*。
===== 两种实用放大电路

*直接耦合放大电路*

将两个电源变成一个，取$R_o < R_(b 2)$

#figure(
  image("pic/2024-03-07-09-32-45.png", width: 80%),
  caption: [
    直接耦合放大电路
  ],
)

静态时，$U_(B E Q) = U_(R_(b 1))$

动态时，$b-e$间电压是$u_i$与$V_"CC"$的共同作用的结果

*阻容耦合放大电路*

#figure(
  image("pic/2024-03-07-09-35-21.png", width: 50%),
  caption: [
    阻容耦合放大电路
  ],
)

静态时，$U_(C 1)=U_(B E Q)$, $U_(C 2)=U_(C E Q)$

动态时，$u_(B E)=u_i + U_(B E Q)$信号驮载在静态之上。负载上只有交流信号。

=== 放大电路的分析方法

==== 放大电路的直流通路和交流通路

1. 直流通路：① $U_s=0$，保留$R_s$；②电容开路；③电感相当于短路（忽略线圈电阻）。
2. 交流通路：①大容量电容（如耦合电容、旁路电容相当于短路；②直流电源相当于短路（理想电压源内阻为0）。

_例：*直接耦合放大电路*的直流通路和交流通路_

#grid(
  columns: (1fr, 2fr),
  align(center)[
    #figure(
  image("pic/2024-03-12-08-25-07.png", width: 65%),
  caption: [
    直流通路 
  ],  
)
  ],
  [
    #figure(
  image("pic/2024-03-12-08-25-19.png", width: 90%),
  caption: [
    交流通路
    ],
  )
  ]
)

静态：
$
I_(B Q) &= (V_"BB" - U_(B E  Q)) / R_b\
I_(C Q) &= beta I_(B Q)\
U_(C E Q) &= V_"CC" - I_(C Q) R_c
$
列晶体管输入、输出回路方程，将$U_(B E Q)$作为已知条件，令$I_(C Q)= β I_(B Q)$，可估算出静态工作点。

_例：*阻容耦合放大电路*的交流通路_

#figure(
  image("pic/2024-03-12-08-28-49.png", width: 50%),
  caption: [
    阻容耦合放大电路的交流通路
  ],
)

==== 图解法
===== 静态分析：图解二元方程

#figure(
  image("pic/2024-03-12-08-33-40.png", width: 80%),
  caption: [
    静态分析
  ],
)
===== 电压放大倍数的分析
$
u_(B E) = V_"BB" - i_B R_b + Delta u_i
$
#grid(
  columns: (1fr, 1fr),
align(center)[#figure(
  image("pic/2024-03-12-08-35-56.png", width: 80%),
  caption: [
    输入信号的放大
  ],
)],
align(center)[#figure(
  image("pic/2024-03-12-08-38-25.png", width: 90%),
  caption: [
    输出信号的放大
  ],
)]
)

$
Delta u_I -> Delta i_B -> Delta i_C -> Delta u_(C E)(Delta u_O) -> A_u
$

可以发现输出的放大倍输入是反向的。

===== 失真分析
// 补：失真的分析和解决方法
*截止失真*：截止失真是在输入回路首先产生失真。
#grid(
  columns: (1fr, 1fr),
[#figure(
  image("pic/2024-03-12-08-50-21.png", width: 70%),
  caption: [
    截止失真的输入
  ],
)],
[#figure(
  image("pic/2024-03-12-08-51-21.png", width: 90%),
  caption: [
    截止失真的输出
  ],
)]
)

截至失真是从输入回路开始的，输入回路底部被削平，导致输出回路失真。

消除方法：
- 增大$V_"BB"$，即向上平移输入回路负载线

    #figure(
      image("pic/2024-03-17-13-21-47.png", width: 60%),
      caption: [
        对于截止失真的消除
      ],
    )
- 减小$R_b$，即向上平移截距

    #figure(
      image("pic/2024-03-17-13-23-56.png", width: 70%),
      caption: [
        对于截止失真的消除
      ],
    )


*饱和失真*：饱和失真是输出回路产生失真。

#figure(
  image("pic/2024-03-17-13-29-00.png", width: 80%),
  caption: [
    饱和失真的输入和输出
  ],
)

部分输出不在放大区，而在饱和区。

消除方法：
- 增大$R_b$、减小$beta$、减小$V_"BB"$——使得$Q'$沿着输出特性曲线向下移动
- 减少$R_c$、增大$V_"CC"$——使得$Q'$向右移动（一般不采用）

*最大不失真输出电压$U_"om"$*：

比较（$U_(C E Q) - U_(C E S)$）与（ $V_"CC" -U_(C E Q)$ ）最小者，除以$sqrt(2)$得到$U_"om"$。

*直流负载线和交流负载线*：

#figure(
  image("pic/2024-03-17-16-39-13.png", width: 40%),
  caption: [
    直流负载线和交流负载线
  ],
)

负载线应过$Q$点，斜率由负载决定。


==== 等效电路法

半导体器件的非线性特性使放大电路的分析复杂化。利用线性元件建立模型，来描述非线性器件的特性。
=====  直流模型：适于$Q$点的分析

$
I_(B Q) &= (V_"BB" - U_(B E  Q)) / R_b\
I_(C Q) &= beta I_(B Q)\
U_(C E Q) &= V_"CC" - I_(C Q) R_c
$

#figure(
  image("pic/2024-03-12-08-58-15.png", width: 40%),
  caption: [
    直流模型
  ],
)

===== 交流模型：晶体管的$h$参数等效模型

在低频、小信号作用下的关系式：
$
dd(u_(B E)) &= (diff u_(B E))/(diff i_B)bar_(U_(C E)) dd(i_B) + (diff u_(B E))/(diff u_(C E))bar_(I_B) dd(u_(C E))\
dd(i_C) &= (diff i_C)/(diff i_B)bar_(U_(C E)) dd(i_B) + (diff i_C)/(diff u_(C E))bar_(I_B) dd(u_(C E))
$
用相量表示：
$
accent(U, dot)_(B E) &= h_(11) accent(I, dot)_B + h_(12) accent(U, dot)_(C E)\
accent(I, dot)_C &= h_(21) accent(I, dot)_B + h_(22) accent(U, dot)_(C E)
$
可以得到交流等效模型：
#figure(
  image("pic/2024-03-12-09-05-02.png", width: 40%),
  caption: [
    交流模型
  ],
)

*$h$参数的物理意义*：

- $h_(11) = ((diff u_(B E))/(diff i_B))bar_(U_(C E)) = r_(b e)$：$b-e$间的动态电阻
- $h_(12) = (diff u_(B E))/(diff u_(C E))bar_(I_B)$：内反馈系数
- $h_(21) = (diff i_C)/(diff i_B)bar_(U_(C E)) = beta$：电流放大系数
- $h_(22) = (diff i_C)/(diff u_(C E))bar_(I_B)= 1/r_(c e)$：$c-e$间的电导

$h_(12)$和$h_(22)$的作用可忽略不计。

#figure(
  image("pic/2024-03-14-08-19-06.png", width: 80%),
  caption: [
    交流模型的等效电路
  ],
)
$
r_(b e)= U_(b e)/I_B = r_(b b')+r_(b' e) = r_(b b') + (beta + 1) U_T / I_(E Q)
$
其中，$r_(b b')$是基区的电阻，$r_(b' e)$是发射区的电阻；$U_T = 26"mV"$。在输入特性曲线上，$Q$点越高，$r_(b e)$越小。

===== 共射放大电路的动态分析

#figure(
  image("pic/2024-03-18-00-47-36.png", width: 80%),
  caption: [
    动态电路等效电路
  ],
)

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = - (beta R_C) / (R_b + r_(b e))\
R_i &= U_i / I_i = R_b + r_(b e)\
R_o &= R_C
$

*阻容耦合共射放大电路的动态分析*

#figure(
  image("pic/2024-03-18-00-54-59.png", width: 80%),
  caption: [
    阻容耦合共射放大电路
  ],
)

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = - (beta (R_L parallel R_C)) / (r_(b e))\
accent(A, dot)_(u s) &= (accent(U, dot)_o) / (accent(U, dot)_S) = (accent(U, dot)_o) / (accent(U, dot)_i) dot (accent(U, dot)_i) / (accent(U, dot)_s) = (R_i)/(R_i + R_s) accent(A, dot)_u\
R_i &= R_b parallel r_(b e)\
R_o &= R_C
$

_静态工作点稳定的共射放大：_
1. 温度对静态工作点的影响
$
T(℃) →cases(
  β↑,I_(C E O)↑,若 U_(C E Q) 不 变，I_(B Q) ↑\
)→I_(C Q)↑ →Q'
$

#newpara()

2、静态工作点稳定的典型电路——分压式电流负反馈工作点稳定电路

#figure(
  image("pic/2024-03-14-08-21-57.png", width: 80%),
  caption: [
    电路组成
  ],
)

可以看到，二者的直流通路一致。

#figure(
  image("pic/2024-03-18-10-17-16.png", width: 20%),
  caption: [
    分压式电流负反馈工作点稳定电路的直流通路
  ],
)

+ 稳定原理

  为了稳定$Q$点，通常$I_1 >> I_B$，即$I_1 ≈ I_2$；因此
  $
  U_(B Q) approx (R_(b 1))/(R_(b 1) + R_(b 2)) V_"CC"
  $
  基本不随温度变化。
  $
  I_(E Q) = (U_(B Q) - U_(B E Q))/R_e
  $
  设$U_(B E Q) =  U_(B E) + Δ U_(B E)$，若$U_(B Q) - U_(B E)>>Δ U_(B E)$，则$I_(E Q)$稳定。

  $R_e$的作用：
  $
  T(℃)↑→I_C↑→U_E↑→U_(B E)↓(U_B"基本不变") → I_B ↓→ I_C↓
  $
  $R_e$起直流负反馈作用，其值越大，反馈越强，$Q$点越稳定。

+ Q点分析

  #figure(
    image("pic/2024-03-18-10-36-25.png", width: 20%),
    caption: [
      直流通路等效电路
    ],
  )
  $
  V_"BB" &= R_(b 1)/(R_(b 1) + R_(b 2)) V_"CC"\
  R_b &= R_(b 1) parallel R_(b 2)\
  $
  $R_b$上静态电压是否可忽略不计？
  $
  V_"BB" = I_(B Q) R_b + U_(B E Q) + (1 + beta)I_(B Q) R_e
  $
  如果$R_b << (1 + beta)R_e$，则可忽略。
  
  剩余参数：
  $
  U_(B Q) &= R_(b 1)/(R_(b 1) + R_(b 2)) V_"CC"\
  I_(E Q) &= (U_(B Q) - U_(B E Q))/R_e\
  I_(B Q) &= I_(E Q) / (1 + beta)\
  U_(C E Q) &= V_"CC" - I_(C Q) R_C - I_(E Q) R_e approx V_"CC" - I_(E Q) (R_C + R_e)
  $
+ 动态分析

  #figure(
    image("pic/2024-03-14-08-35-12.png", width: 80%),
    caption: [
      分压式电流负反馈动态电路
    ],
  )

  $
  accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = - (beta R_L) / (r_(b e))\
  R_i &= R_(b 1) parallel R_(b 2) parallel r_(b e)\
  R_o &= R_C
  $

  #figure(
    image("pic/2024-03-18-10-44-50.png", width: 80%),
    caption: [
      分压式电流负反馈动态电路——无旁路电容
    ],
  )
  $
  accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = - (beta (R_L parallel R_C)) / (r_(b e) + (1 + beta) R_e) ->^((1+beta)R_e >> r_(b e)) - (R_L) / ( R_e)\
  R_i &= R_(b 1) parallel R_(b 2) parallel (r_(b e) +  (1 + beta) R_e)\
  $

#figure(
  image("pic/2024-03-18-10-52-38.png", width: 80%),
  caption: [
    稳定工作点的放大电路
  ],
)

=== 晶体管放大电路的三种接法
==== 基本共集放大电路

#figure(
  image("pic/2024-03-18-10-54-36.png", width: 40%),
  caption: [
    基本共集放大电路
  ],
)
===== 静态分析

#figure(
  image("pic/2024-03-18-10-55-14.png", width: 35%),
  caption: [
    静态分析电路
  ],
)

$
V_"BB" &= I_(B Q) R_b + U_(B E Q) + I_(E Q) R_e\
V_"CC" &= U_(C E Q) + I_(E Q) R_e\
$
$
I_(B Q) &= (V_"BB" - U_(B E Q)) / (R_b + (1 + beta) R_e)\
I_(E Q) &= (1 + beta) I_(B Q)\
U_(C E Q) &= V_"CC" - I_(E Q) R_e
$
===== 动态分析

#figure(
  image("pic/2024-03-18-10-59-56.png", width: 40%),
  caption: [
    动态分析电路
  ],
)

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = ((1 + beta)R_e) / (R_b + r_(b e) + (1 + beta)R_e)\
$
若$(1+beta)R_e >> R_b + r_(b e)$，则$accent(A, dot)_u -> 1$：*射极跟随器*。
$
R_i &= R_b + r_(b e) + (1 + beta) R_e\
$
从基极看$R_e$，被增大到$1+beta$倍。带负载电阻后：
$
R_i &= R_b + r_(b e) + (1 + beta) (R_e parallel R_L)\
$
*$R_i$与负载有关。*
$
R_o &= R_e parallel (R_b + r_(b e))/(1 + beta)
$
从射极看基极回路电阻，被减小到$1+β$倍。

===== 特点

*输入电阻大，输出电阻小；只放大电流（功率），不放大电压；在一定条件下有电压跟随作用。*

==== 基本共基放大电路

#figure(
  image("pic/2024-03-18-11-07-00.png", width: 40%),
  caption: [
    基本共基放大电路
  ],
)

===== 静态分析

$
V_"BB" &= U_(B E Q) + I_(E Q) R_e\
V_"CC" &= U_(C E Q) - U_(B E Q) + I_(C Q) R_e\
$
$
I_(E Q) &= (V_"BB" - U_(B E Q)) / R_e\
I_(B Q) &= I_(E Q) / (1 + beta)\
U_(C E Q) &= V_"CC" - I_(E Q) R_e + U_(B E Q)
$

===== 动态分析

#figure(
  image("pic/2024-03-18-11-12-12.png", width: 40%),
  caption: [
    动态分析电路
  ],
)

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = (beta R_c) / (r_(b e) + (1 + beta) R_e)\
R_i &=  R_e + r_(b e)/(1 + beta)\
R_o &= R_c 
$

===== 特点

*输入电阻小，频带宽。只放大电压，不放大电流。电流跟随。*

==== 三种接法的比较：空载情况下

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [接法],[*共射*],[*共集*],[*共基*],
    [$A_u$],[大],[小于1],[大],
    [$A_i$],[$beta$],[$1+beta$],[$alpha$],
    [$R_i$],[中],[大],[小],
    [$R_o$],[大],[小],[大],
    [频带],[窄],[中],[宽],
  ),
  caption: [
    三种接法的比较
  ],
)

== 放大电路的频率响应

=== 频率响应的有关概念

放大电路对信号频率的适应程度，即信号频率对放大倍数的影响。

由于放大电路中耦合电容、旁路电容、半导体器件极间电容的存在，使放大倍数为频率的函数。

在使用一个放大电路时应了解其信号频率的适用范围，在设计放大电路时，应满足信号频率的范围要求。

==== 高通电路和低通电路

*高通电路*:信号频率越高，输出电压越接近输入电压。

#figure(
  image("pic/2024-03-19-08-15-31.png", width: 80%),
  caption: [
    高通电路
  ],
)

*低通电路*:信号频率越低，输出电压越接近输入电压。

#figure(
  image("pic/2024-03-19-08-15-49.png", width: 80%),
  caption: [
    低通电路
  ],
)

==== 放大电路中的频率参数

在低频段，随着信号频率逐渐降低，耦合电容、旁路电容等的容抗增大，使动态信号损失，放大能力下降。

在高频段，随着信号频率逐渐升高，晶体管极间电容和分布电容、寄生电容等杂散电容的容抗减小，使动态信号损失，放大能力下降。

#figure(
  image("pic/2024-03-19-08-19-41.png", width: 80%),
  caption: [
    放大电路中的频率参数
  ],
)

== 场效应管及其应用

=== 结型场效应管（以N沟道为例）

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      image("pic/2024-03-19-08-25-29.png", width: 40%),
      caption: [
        结型场效应管符号
      ],
    )],
    [
    #figure(
      image("pic/2024-03-19-08-25-49.png", width: 40%),
      caption: [
        结型场效应管结构
      ],
    )
  ]
)

场效应管有三个极：源极（s）、栅极（g）、漏极（d）。

===== 工作原理

*栅-源电压对导电沟道宽度的控制作用*

#figure(
  image("pic/2024-03-19-08-28-15.png", width: 80%),
  caption: [
    栅-源电压对导电沟道宽度的控制作用
  ],
)

$u_(G S)$可以控制导电沟道的宽度。g-s必须加负电压#footnote[P沟道的必须要加正压]，才能使沟道导电。否则PN结导通。

*漏-源电压对漏极电流的影响*

#figure(
  image("pic/2024-03-19-08-33-26.png", width: 80%),
  caption: [
    漏-源电压对漏极电流的影响
  ],
)

对外等效电阻越来越大，但$V_"DD"$的增大，几乎全部用来克服沟道的电阻，$i_D$几乎不变，进入恒流区。$U_(D S)$的增大会把$i_D$带向恒流区。

===== 特性

*转移特性*$i_D = f(u_(G S))|_(U_(D S)="常量")$

场效应管工作在恒流区，因而$u_(G S)>U_(G S("off"))$，且$u_(G D)< U_(G D("off"))$。

#figure(
  image("pic/2024-03-19-08-40-26.png", width: 40%),
  caption: [
    结型场效应管的转移特性
  ],
)

在恒流区时
$
i_D = I_"DSS" (1 - u_(G S)/U_(G S("off")))^2
$

#newpara()

*输出特性*

#figure(
  image("pic/2024-03-19-08-43-00.png", width: 80%),
  caption: [
    结型场效应管的输出特性
  ],
)

- 恒流区：压控电流源
- 不同型号的管子$U_(G S("off"))$ 、$I_"DSS"$将不同。
- 跨导:
  $
  g_m = (diff i_D)/(diff u_(G S)) |_(U_(D S))
  $

==== MOSFET(金属氧化物半导体场效应管)

*增强型MOS管*
#figure(
  image("pic/2024-03-21-00-35-40.png", width: 80%),
  caption: [
    MOSFET的结构
  ],
)

对N沟道的MOSFET，在g-b加电场时候，电子被吸引到绝缘的氧化层底部（但不形成电流），形成反型层（局部N型半导体），导通sd沟道。



$u_(G S)$增大，反型层（导电沟道）将变厚变长。当反型层将两个N区相接时，形成导电沟道。

#figure(
  image("pic/2024-03-19-09-14-55.png", width: 80%),
  caption: [
    增强型MOSFET
  ],
)

一般把源极和衬底短接，即$u_(G S) = u_(G D)$。

#figure(
  image("pic/2024-03-21-00-38-24.png", width: 80%),
  caption: [
    $u_(D S)$对$i_D$的影响
  ],
)

用场效应管组成放大电路时应使之工作在恒流区。N沟道增强型MOS管工作在恒流区的条件是$u_(G S) > U_(G S("off"))$。

*耗尽型MOS管*

#figure(
  image("pic/2024-03-21-00-43-58.png", width: 80%),
  caption: [
    耗尽型MOSFET
  ],
)

在原来增强型的基础上，加了一个P型衬底（使得原来$"SiO"_2$的地方充满正离子），使得$U_(G S("off")) < 0$。

耗尽型MOS管在$u_(G S)> 0$、$u_(G S)< 0$、$u_(G S) = 0$时均可导通，且与结型场效应管不同，由于$"SiO"_2$绝缘层的存在，在$u_(G S)> 0$时仍保持g-s间电阻非常大的特点。

===== MOSFET的特性

#figure(
  image("pic/2024-03-19-09-21-02.png", width: 80%),
  caption: [
    增强型MOS管
  ],
)

#figure(
  image("pic/2024-03-19-09-23-28.png", width: 80%),
  caption: [
    耗尽型MOS管
  ],
)

在恒流区时
$
i_D = I_"DO" (1 - u_(G S)/U_(G S("th")))^2
$
其中$I_"DO"$为$u_(G S) = 2 U_(G S("th"))$时的漏极电流$i_D$。

===== 场效应管的分类
工作在恒流区时g-s、 d-s间的电压极性。

$
"场效应管"
cases(
  "结型场效应管" 
  cases(
    "N沟道型" (u_(G S) < 0, u_(D S) > 0),
    "P沟道型" (u_(G S) > 0, u_(D S) < 0)
  ),
  "绝缘栅型场效应管"
  cases(
    "增强型" 
    cases(
      "N沟道型" (u_(G S) > 0, u_(D S) > 0),
      "P沟道型" (u_(G S) < 0, u_(D S) < 0)
    ),
    "耗尽型" 
    cases(
      "N沟道型" (u_(G S) "极性任意", u_(D S) > 0),
      "P沟道型" (u_(G S) "极性任意", u_(D S) < 0)
    )
  ),
)
$

== 场效应管基本放大电路

=== 场效应管静态工作点的设置方法

==== 基本共源放大电路

根据场效应管工作在恒流区的条件，在g-s、d-s间加极性合适的电源：

#figure(
  image("pic/2024-03-19-09-26-08.png", width: 40%),
  caption: [
    基本共源放大电路
  ],
)

$
U_"DSQ" &= V_"BB" \
I_"DQ" &= I_"DO" (1 - u_"BB"/U_("G S(th)"))^2\
U_"DSQ" &= V_"DD" - I_"DQ" R_D
$
==== 自给偏压电路

#figure(
  image("pic/2024-03-21-00-55-22.png", width: 40%),
  caption: [
    自给偏压电路
  ],
)

$
U_(G Q) &= 0, U_(S Q)=I_(D Q)R_s\
U_(G S Q) &= U_(G Q) - U_(S Q) = -I_(D Q)R_s\
$

由正电源获得负偏压称为自给偏压。

$
I_(D Q) &= I_"DSS" (1 - U_(G S Q)/U_(G S("OFF")))^2\
U_(D S Q) &= V_"DD" - I_(D Q) (R_d +R_s)
$

==== 分压式偏置电路

即典型的Q点稳定电路

#figure(
  image("pic/2024-03-21-00-57-05.png", width: 40%),
  caption: [
    分压式偏置电路
  ],
)

$
U_(G Q) &= U_(A Q) = R_(g 1)/(R_(g 1) + R_(g 2)) V_"DD"\
U_(S Q) &= I_(D Q) R_s\
I_(D Q) &= I_"DO" (1 - U_(G S Q)/U_(G S("th")))^2\
U_(D S Q) &= V_"DD" - I_(D Q) (R_d + R_s)
$

=== 场效应管放大电路的动态分析

==== 场效应管的交流等效模型

#figure(
  image("pic/2024-03-21-08-13-10.png", width: 40%),
  caption: [
    场效应管的交流等效模型
  ],
)

其中g-s断路是因为绝缘。而$r_"ds"$可以认为忽略不计。

根据$i_D$的表达式或转移特性可以求得$g_m$。

结型N沟道管：
$
g_m approx - 2/U_(G S("off")) sqrt(I_"DSS" I_"DQ")
$

==== 基本共源放大电路的动态分析

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      image("pic/2024-03-21-08-17-35.png", width: 40%),
      caption: [
        基本共源放大电路
      ],
    )],
    [
    #figure(
      image("pic/2024-03-21-08-17-42.png", width: 80%),
      caption: [
        基本共源放大电路的动态分析
      ],
    )
  ]
)

可以与共射电路对比：方向放大。

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = - g_m R_D \
R_i &= oo \
R_o &= R_D
$

==== 基本共漏放大电路的动态分析

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      image("pic/2024-03-21-08-19-59.png", width: 40%),
      caption: [
        基本共漏放大电路
      ],
    )],
    [
    #figure(
      image("pic/2024-03-21-08-20-05.png", width: 80%),
      caption: [
        基本共漏放大电路的动态分析
      ],
    )
  ]
)

可以与共基电路对比：跟随器。

$
accent(A, dot)_u &= (accent(U, dot)_o) / (accent(U, dot)_i) = (accent(I, dot)_d R_s)/(accent(U, dot)_"gs" + accent(I, dot)_d R_s) = (g_m R_s)/(1 + g_m R_s) approx 1\
R_i &= oo\
R_o &= U_o/I_o =^(U_"gs"=U_o) U_o / (U_o/R_s + g_m U_o) = R_s parallel (1/g_m)
$

== 集成运算放大电路