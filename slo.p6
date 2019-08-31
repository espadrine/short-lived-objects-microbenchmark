#!/usr/bin/env perl6
class Point {
  has $.x;
  has $.y;
}
my $total = 0;
for ^1_000_000 {
  my $p = Point.new(x => 2, y => 3);
  $total = $total + $p.x + $p.y;
}
say $total;
