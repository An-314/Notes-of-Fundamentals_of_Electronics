#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第10次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 84%) = align(center, image(path, width: width))

#exercise(subname: [7.4])[
  图 P7.4 是用 CMOS 反相器接成的压控施密特触发电路。分析转换电平 $V_(T+)$、$V_(T-)$ 以及回差电压 $Delta V_T$ 与控制电压 $V_(C O)$ 的关系。

  #hw-figure("pic/10-p7.4.png")
]

#solution[
  设反相器 $G_1$ 的阈值电压为 $V_(T H)$，公共节点电压为 $v_A$。节点方程为
  $
    (v_A-v_i)/R_1+(v_A-v_o)/R_2+(v_A-V_(C O))/R_3=0.
  $
  当输入上升、输出尚为低电平时，令 $v_A=V_(T H)$、$v_o=0$，得到
  $
    V_(T+)=V_(T H)(1+R_1/R_2+R_1/R_3)
      -R_1/R_3 V_(C O).
  $
  当输入下降、输出尚为高电平时，令 $v_o=V_(D D)$，得到
  $
    V_(T-)=V_(T H)(1+R_1/R_2+R_1/R_3)
      -R_1/R_2 V_(D D)-R_1/R_3 V_(C O).
  $
  因而
  $
    Delta V_T=V_(T+)-V_(T-)=R_1/R_2 V_(D D).
  $
  控制电压使两个转换电平以斜率 $-R_1/R_3$ 同向平移，但不改变回差宽度。
]

#exercise(subname: [7.5])[
  在图 P7.2 的施密特触发电路中，$V_(D D)=5 "V"$。若要求回差电压 $Delta V_T=2 "V"$，为 $R_1$、$R_2$ 选择合适阻值并说明允许范围。反相器高电平输出电流最大允许值为 $4 "mA"$，此时输出高电平为 $4.85 "V"$。

  #hw-figure("pic/10-p7.5.png", width: 72%)
]

#solution[
  该电路的回差电压为
  $
    Delta V_T=R_1/R_2 V_(D D).
  $
  因此
  $
    R_1/R_2=2/5.
  $
  取 CMOS 阈值约为 $V_(T H)=V_(D D)/2=2.5 "V"$。高电平输出时反馈电流不能超过 $4 "mA"$，故
  $
    R_2 >= (V_(O H)-V_(T H))/(4 "mA")
      =(4.85-2.5) "V"/(4 "mA")
      =587.5 Omega.
  $
  相应地
  $
    R_1=2/5 R_2 >= 235 Omega.
  $
  例如可以选取
  $
    R_2=10 "k" Omega, quad R_1=4 "k" Omega.
  $
]

#exercise(subname: [补充])[
  对图示具有两条汇合路径的组合逻辑网络进行流水线设计：（1）求能够获得的最大吞吐率；（2）若要求吞吐率高于 $1/(5 "ns")$，插入最少数量的触发器。
]

#solution[
  理想切分后，最长单级组合延迟为 $3 "ns"$，所以最大吞吐率为
  $
    T_(max)=1/(3 "ns").
  $
  若时钟周期要求小于 $5 "ns"$，应在累积组合延迟达到 $5 "ns"$ 以前切分，并在汇合路径上补齐等量寄存器以保持数据对齐。按原设计最少需要 6 个触发器。
  #hw-figure("pic/10-pipeline.png")
]
