//usr/bin/env gcc -o /tmp/a.out $0; /tmp/a.out; rm /tmp/a.out; exit $?
#include <stdio.h>
typedef struct Point {
  int x;
  int y;
} Point;

int main() {
  int total = 0;
  for (int i = 0; i < 1000000; i++) {
    Point p = { .x = 2, .y = 3 };
    total = total + p.x + p.y;
  }
  printf("%d\n", total);
  return 0;
}
