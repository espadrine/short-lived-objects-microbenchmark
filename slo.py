#!/usr/bin/env python3
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

total = 0
for _ in range(1000000):
    p = Point(2, 3)
    total = total + p.x + p.y

print(total)
