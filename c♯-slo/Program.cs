//usr/bin/env dotnet run -p `dirname $0`; exit $?
using System;
class Point
{
  public int x, y;
  public Point(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}

class Program
{
    static void Main()
    {
        int total = 0;
        for (int i = 0; i < 1000000; i++) {
          Point p = new Point(2, 3);
          total = total + p.x + p.y;
        }
        Console.WriteLine(total);
    }
}
