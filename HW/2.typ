#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第2次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 92%) = align(center, image(path, width: width))

#exercise(subname: [4.6])[
  在图 P4.6 所示各电路中，已知晶体管发射结正向导通电压为 $U_(B E) = 0.7 "V"$，$beta = 100$，$u_(B C) = 0$ 为临界放大（饱和）状态。分别判断各电路中晶体管的工作状态（放大、饱和或截止），并求解各电路中的电流 $I_B$ 和 $I_(C 0)$。

  #hw-figure("pic/2-p4.6-abc.png")
  #hw-figure("pic/2-p4.6-def.png")
]

#solution[
  （a）若先假设晶体管工作在放大区，则
  $
    I_B = (2 "V" - 0.7 "V")/(10 "k" Omega) = 0.13 "mA",
  $
  $
    I_C = beta I_B = 13 "mA".
  $
  由此算得 $u_C = 12 "V" - I_C dot 10 "k" Omega < 0$，与放大区条件矛盾，故晶体管实际处于饱和区。取临界饱和条件 $u_C = u_B = 0.7 "V"$，得到
  $
    I_B = 0.13 "mA", quad
    I_(C 0) = (12 "V" - 0.7 "V")/(10 "k" Omega) = 1.13 "mA".
  $

  （b）发射结反向偏置，晶体管截止，故
  $
    I_B = I_(C 0) = 0.
  $

  （c）发射结正向偏置。因发射极电位为 $-5 "V"$，故 $u_B = -4.3 "V"$，从而
  $
    I_B = (0 "V" - (-4.3 "V"))/(100 "k" Omega) = 0.043 "mA",
  $
  $
    I_(C 0) = beta I_B = 4.3 "mA".
  $
  此时 $u_C = 5 "V" - 4.3 "mA" dot 1 "k" Omega = 0.7 "V"$，集电结保持反向偏置，故晶体管工作在放大区。

  （d）对 PNP 管而言，发射结反向偏置，晶体管截止，故
  $
    I_B = I_(C 0) = 0.
  $

  （e）晶体管工作在放大区。由 $I_E = (beta + 1) I_B$ 以及
  $
    u_E = 1 "V" + 2 "k" Omega I_B + 0.7 "V"
  $
  可得
  $
    (8 "V" - u_E)/(1 "k" Omega) = 101 I_B.
  $
  因而
  $
    I_B = 63/1030 "mA" approx 0.0612 "mA", quad
    I_(C 0) = beta I_B approx 6.12 "mA".
  $

  （f）晶体管工作在放大区。设基极电流由 $0 "V"$ 电源经 $2 "k" Omega$ 电阻流入基极，则
  $
    u_B = -2 "k" Omega I_B, quad
    u_E = u_B - 0.7 "V".
  $
  再由
  $
    (u_E + 5 "V")/(1 "k" Omega) = (beta + 1) I_B
  $
  得到
  $
    I_B = 43/1030 "mA" approx 0.0417 "mA", quad
    I_(C 0) = beta I_B approx 4.17 "mA".
  $
]

#exercise(subname: [4.8])[
  在图 P4.8 所示各电路中分别改正一处错误，使它们有可能放大正弦波信号 $u_i$。设所有电容对交流信号均可视为短路。

  #hw-figure("pic/2-p4.8.png", width: 85%)
]

#solution[
  各图的关键错误及改法如下。

  （a）耦合电容位于直流偏置电源 $V_(B B)$ 与基极之间，使直流偏置被隔断。应去掉该电容，或者把耦合电容移到信号源一侧，使 $V_(B B)$ 能通过 $R_b$ 建立静态基极电流。

  （b）输出端直接接在集电极上，含有直流分量。应在集电极与输出端之间串联输出耦合电容；输入端原有的耦合电容保留。

  （c）PNP 管发射结的直流偏置方向错误。应将 $V_(B B)$ 的极性反接，使基极电位低于发射极约 $0.7 "V"$。

  （d）输入信号源直接改变了基极的静态偏置。应在输入端串联耦合电容，并用 $R_b$ 单独建立合适的静态工作点。
]
