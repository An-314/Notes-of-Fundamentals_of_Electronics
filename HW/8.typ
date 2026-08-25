#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [电子技术基础第8次作业],
  author: "Anzreww",
  time: "2024年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#let waveform(path, width: 86%) = align(center, image(path, width: width))

#exercise(subname: [5.4])[
  根据题给时序条件画出输出波形。
]
#solution[
  原解答给出的两路互补时序波形如下；虚线表示需要判断输出翻转的时刻。
  #waveform("pic/8-wave-1.png")
]

#exercise(subname: [5.11])[
  根据题给时序条件画出 $Q$ 与 $Q'$ 的波形。
]
#solution[
  #waveform("pic/8-wave-2.png")
]

#exercise(subname: [5.12])[
  根据题给时序条件画出 $Q$ 与互补输出的波形。
]
#solution[
  #waveform("pic/8-wave-3.png")
]

#exercise(subname: [5.14])[
  根据题给时序条件画出 $Q$ 与 $Q'$ 的波形。
]
#solution[
  #waveform("pic/8-wave-4.png")
]

#exercise(subname: [5.15])[
  根据题给时序条件画出 $Q$ 与互补输出的波形。
]
#solution[
  #waveform("pic/8-wave-5.png")
]

#exercise(subname: [5.22])[
  根据输入 $V_I$、时钟或控制脉冲，画出 $V_O$ 以及各级触发器输出波形。
]
#solution[
  原稿先标出了输入和窄脉冲输出，并把同相的触发器输出归为两组：
  #waveform("pic/8-wave-6.png", width: 76%)
  后续波形为
  #waveform("pic/8-wave-7.png")
]
