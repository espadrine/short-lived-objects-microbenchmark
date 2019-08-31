#!/usr/bin/env dart
class Point {
  var x, y;
  Point(this.x, this.y);
}

main() {
  var total = 0;
  for (var i = 0; i < 1000000; i++) {
    Point p = Point(2, 3);
    total = total + p.x + p.y;
  }
  print(total);
}
