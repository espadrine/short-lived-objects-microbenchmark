#!/usr/bin/env ruby
class Point
  attr_reader :x, :y
  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end
end

total = 0
1000000.times do
  p = Point.new(x: 2, y: 3)
  total = total + p.x + p.y
end

puts total
