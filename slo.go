//usr/bin/env go run $0 $@; exit $?
package main

import "fmt"

type Point struct {
	x int
	y int
}

func main() {
	total := 0
	for i := 0; i < 1000000; i++ {
		p := Point{2, 3}
		total = total + p.x + p.y
	}
	fmt.Println(total)
}
