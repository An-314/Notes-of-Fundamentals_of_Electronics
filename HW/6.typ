#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第6次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let hw-figure(path, width: 76%) = align(center, image(path, width: width))

#exercise(subname: [2.16])[
  用卡诺图化简法将下列函数化为最简与或形式：

  （1）$Y=A B C+A B D+C'D'+A B'C+A'C D'+A C'D$；

  （2）$Y=A B'+A'C+B C+C'D$；

  （3）$Y=A'B'+B C'+A'+B'+A B C$；

  （4）$Y=A'B'+A C+B'C$；

  （5）$Y=A B'C'+A'B'+A'D+C+B D$；

  （6）$Y(A,B,C)=sum m(0,1,2,5,6,7)$；

  （7）$Y(A,B,C,D)=sum m(0,1,2,5,8,9,10,12,14)$；

  （8）$Y(A,B,C)=sum m(1,4,7)$。
]

#solution[
  将相邻的 1 按 $2^n$ 个方格成组，得到
  $
    Y_1=A+D',
  $
  $
    Y_2=C+D+A B',
  $
  $
    Y_3=1,
  $
  $
    Y_4=A'B'+A C,
  $
  $
    Y_5=B'+C+D,
  $
  $
    Y_6=A'B'+B C'+A C,
  $
  $
    Y_7=B'D'+A D'+B'C'+A'C'D,
  $
  $
    Y_8=A'B'C+A B'C'+A B C.
  $
]

#exercise(subname: [2.20])[
  将下列具有约束项的逻辑函数化为最简与或形式：

  （1）$Y_1=A B'C'+A B C+A'B'C+A'B C'$，约束条件为 $A'B'C'+A'B C=0$；

  （2）$Y_2=(A+C+D)'+A'B'C D'+A B'C'D$，约束条件为
  $
    A B'C D'+A B'C D+A B C'D'+A B C'D+A B C D'+A B C D=0;
  $

  （3）$Y_3=C D'(A ⊕ B)+A'B C'+A'C'D$，约束条件为 $A B+C D=0$；

  （4）$Y_4=(A B'+B)C D'+((A+B)(B'+C))'$，约束条件为
  $
    A B C+A B D+A C D+B C D=0.
  $
]

#solution[
  在卡诺图中把约束项作为无关项使用，可得
  $
    Y_1=A'+B'C'+B C,
  $
  $
    Y_2=A'C'D'+A'B'D'+A D,
  $
  $
    Y_3=B+A'D+A C,
  $
  $
    Y_4=A'+B+C.
  $
]

#exercise(subname: [2.21])[
  将下列具有无关项的逻辑函数化为最简与或式：

  （1）$Y_1(A,B,C)=sum m(0,1,2,4)+d(5,6)$；

  （2）$Y_2(A,B,C)=sum m(1,2,4,7)+d(3,6)$；

  （3）$Y_3(A,B,C,D)=sum m(3,5,6,7,10)+d(0,1,2,4,8)$；

  （4）$Y_4(A,B,C,D)=sum m(2,3,7,8,11,14)+d(0,5,10,15)$。
]

#solution[
  利用无关项扩大卡诺圈，得到
  $
    Y_1=C'+B',
  $
  $
    Y_2=B+A'C+A C',
  $
  $
    Y_3=A'+B'D',
  $
  $
    Y_4=C D+A C+B'D'.
  $
]

#exercise(subname: [2.26])[
  将下列逻辑函数式化为与非-与非形式，并画出全部由与非逻辑单元组成的逻辑电路图：

  （1）$Y=A B+B C+A C$；

  （2）$Y=(A'+B)(A+B')C+(B C)'$；

  （3）$Y=(A B C'+A B'C+A'B C)'$；

  （4）$Y=A(B C)'+((A B')'+A'B'+B C)'$。
]

#solution[
  （1）直接作两级与非-与非变换：
  $
    Y=((A B)'(B C)'(A C)')'.
  $

  （2）先化简
  $
    Y=A B C+(B C)'=A+(B C)'=(A'B C)'.
  $

  （3）原式已经是第一层三个与项经末级与非得到的形式。若所有反变量也由与非门产生，则可写成
  $
    Y=((A'B')'(A'C')'(B'C')'(A B C)')'.
  $

  （4）化简得
  $
    Y=A B'+A C'=A(B C)'.
  $
  相应的原手绘与非门实现如下。

  #hw-figure("pic/6-p2.26-1.png")
  #hw-figure("pic/6-p2.26-2.png")
]
