#!/usr/bin/env node
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
}

let total = 0;
for (let i = 0; i < 1000000; i++) {
  const p = new Point(2, 3);
  total = total + p.x + p.y;
}
console.log(total);
