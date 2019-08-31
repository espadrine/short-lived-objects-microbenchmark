#!/usr/bin/env julia
struct Point
  x::Int
  y::Int
end

let
  total = 0
  for i = 1:1_000_000
    p = Point(2, 3)
    total = total + p.x + p.y
  end
  println(total)
end
