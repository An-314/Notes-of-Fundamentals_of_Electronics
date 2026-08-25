#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第5次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 82%) = align(center, image(path, width: width))

#exercise(subname: [2.3])[
  已知逻辑函数 $Y_1$ 和 $Y_2$ 的真值表如表 P2.3(a)、(b) 所示，试写出 $Y_1$ 和 $Y_2$ 的逻辑函数式。当前扫描页给出了表 P2.3(b)。

  #hw-figure("pic/5-p2.3b.png", width: 66%)
]

#solution[
  从表 P2.3(b) 读出 $Y_2=1$ 的最小项编号为
  $
    1, 2, 4, 7, 8, 11, 13, 14.
  $
  因而
  $
    Y_2=sum m(1,2,4,7,8,11,13,14)
  $
  $
    =A' B' C' D+A' B' C D'+A' B C' D'+A' B C D
  $
  $
    quad +A B' C' D'+A B' C D+A B C' D+A B C D'.
  $
]

#exercise(subname: [2.6])[
  写出图 P2.6(b) 所示电路的输出逻辑函数式。

  #hw-figure("pic/5-p2.6b.png", width: 58%)
]

#solution[
  上支路为异或 $A ⊕ B$，下支路为 $(B C')'$，最后一级为或非门。因此
  $
    Y_2=((A ⊕ B)+(B C')')'.
  $
  利用德摩根律，
  $
    Y_2=(A ⊕ B)' B C'
       =(A' B'+A B) B C'
       =A B C'.
  $
]

#exercise(subname: [2.8])[
  已知逻辑函数 $Y$ 的波形图如图 P2.8 所示，试求 $Y$ 的真值表和逻辑函数式。

  #hw-figure("pic/5-p2.8.png")
]

#solution[
  按虚线分隔的八个时间区间读取 $A$、$B$、$C$ 和 $Y$，得到
  #three-line-table[
    | $A$ | $B$ | $C$ | $Y$ |
    | --- | --- | --- | --- |
    | 0 | 0 | 0 | 0 |
    | 1 | 0 | 0 | 0 |
    | 0 | 1 | 0 | 0 |
    | 1 | 1 | 0 | 1 |
    | 0 | 0 | 1 | 0 |
    | 1 | 0 | 1 | 1 |
    | 0 | 1 | 1 | 1 |
    | 1 | 1 | 1 | 0 |
  ]
  因而
  $
    Y=A B C'+A B' C+A' B C.
  $
  即当三个输入中恰有两个为 1 时，输出为 1。
]

#exercise(subname: [2.10])[
  将下列各函数化为最小项之和的形式：

  （2）$Y=A B' C' D+B C D+A' D$；

  （6）$Y=(((A ⊙ B)'(C ⊙ D)))'$，其中 $⊙$ 表示同或。
]

#solution[
  （2）逐项展开为最小项，
  $
    A B' C' D=m_9,
  $
  $
    B C D=m_7+m_(15),
  $
  $
    A' D=m_1+m_3+m_5+m_7.
  $
  所以
  $
    Y=sum m(1,3,5,7,9,15).
  $

  （6）由德摩根律，
  $
    Y=(A ⊙ B)'+(C ⊙ D)'
      =(A ⊕ B)+(C ⊕ D).
  $
  展开并补齐无关变量即可得到相应最小项之和；其简洁的与或式为
  $
    Y=A' B+A B'+C' D+C D'.
  $
]

#exercise(subname: [2.11])[
  将下列各式化为最大项之积的形式：

  （3）$Y=A' B C'+B' C+A B' C$；

  （4）$Y=B C D'+C+A' D$。
]

#solution[
  （3）原式中 $A B' C$ 被 $B' C$ 包含，所以
  $
    Y=A' B C'+B' C.
  $
  其函数值为 0 的组合为 $0,3,4,6,7$，故规范最大项之积为
  $
    Y=product M(0,3,4,6,7).
  $
  展开为
  $
    Y=(A+B+C)(A+B'+C')(A'+B+C)
  $
  $
    quad dot (A'+B'+C)(A'+B'+C').
  $

  （4）利用吸收律 $C+B C D'=C$，先化为
  $
    Y=C+A' D.
  $
  再利用 $X+Y Z=(X+Y)(X+Z)$，得到最简与或形式
  $
    Y=(C+A')(C+D).
  $
]

#exercise(subname: [2.13])[
  用逻辑代数的基本公式和常用公式，将下列逻辑函数化为最简与或式：
  $
    Y=A B'(A' C D+(A D+B' C')')(A'+B).
  $
]

#solution[
  注意到原式同时含有因子 $A B'$ 和 $(A'+B)$，而
  $
    A B'(A'+B)=A B' A'+A B' B=0.
  $
  因此无论中间因子为何，均有
  $
    Y=0.
  $
]
