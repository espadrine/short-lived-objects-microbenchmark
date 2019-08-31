//usr/bin/env javac $0; cd $(dirname $0); java slo; exit $?
class Point {
  public int x, y;
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

public class slo {
  public static void main(String[] args) {
    int total = 0;
    for (int i = 0; i < 1000000; i++) {
      Point p = new Point(2, 3);
      total = total + p.x + p.y;
    }
    System.out.println(total);
  }
}
