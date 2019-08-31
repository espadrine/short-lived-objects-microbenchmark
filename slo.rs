//usr/bin/env rustc -o /tmp/a.out $0; /tmp/a.out; rm /tmp/a.out; exit $?
struct Point {
    x: i32,
    y: i32,
}

fn main() {
    let mut total = 0;
    for _ in 0..1_000_000 {
        let p = Point { x: 2, y: 3 };
        total = total + p.x + p.y;
    }
    println!("{}", total);
}
