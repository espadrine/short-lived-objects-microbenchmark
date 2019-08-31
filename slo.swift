#!/usr/bin/env swift
class Point {
  var x = 0, y = 0
  init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}

var total = 0
for _ in 0..<1_000_000 {
  let p = Point(x: 2, y: 3)
  total = total + p.x + p.y
}

print(total)
