#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  template: "book",
  title: "电子技术基础",
  author: (
    "Anzreww",
  ),
  time: "甲辰春夏于清华园",
  contents: true,
  content-depth: 3,
  par-leading: 0.8em,
  font-size: 12pt,
)

#pagebreak(weak: true)

#figure(
  image("pic/2024-02-29-08-06-56.png", width: 80%),
  caption: [
    电子技术基础
  ],
)

#include "chap1.typ"

#pagebreak(weak: true)

#include "chap2.typ"

#pagebreak(weak: true)

#include "chap3.typ"
