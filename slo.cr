#!/usr/bin/env crystal
class Point
  property x, y
  def initialize(@x : Int64, @y : Int64)
  end
end

total = 0
1_000_000.times do
  p = Point.new(2, 3)
  total += p.x + p.y
end

puts total
