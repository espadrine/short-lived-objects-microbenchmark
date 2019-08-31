#!/usr/bin/env ocaml
type point = {x: int; y: int};;

let total = ref 0 in
for i = 1 to 1000000 do
  let p = {x=2; y=3} in
  total := !total + p.x + p.y
done;

print_int !total;
print_newline ()
