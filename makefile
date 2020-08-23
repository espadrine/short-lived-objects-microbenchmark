SHELL=bash
TARGETS=swift c go rust haskell ocaml dotnet java dart crystal
PROGRAMS=slo.{p6,rb,cr,py,jl,dart,js,java,cs,hs,ml,scm,lisp,swift,go,rs,c} $(TARGETS)

run: all
	@for prog in $(PROGRAMS); do \
		echo -n $$prog'	'; \
		{ time (./$$prog >/dev/null 2>&1) } 2>&1 | grep real | cut -f 2; \
	done | sort --key=2 | column -t

all: $(TARGETS)

swift:
	swiftc -O -o swift slo.swift

c:
	gcc -o c slo.c

go:
	go build -o go slo.go

rust:
	rustc -o rust slo.rs

haskell:
	ghc -o haskell slo.hs
	rm slo.hi

ocaml:
	ocamlopt -o ocaml -pp 'tail -n +2' slo.ml
	rm slo.{cmi,cmx,o}

java:
	javac slo.java
	echo '#!/bin/bash' >java
	echo 'java slo' >>java
	chmod +x ./java

dotnet:
	cd c♯-slo; dotnet build
	echo '#!/bin/bash' >dotnet
	echo 'dotnet c♯-slo/bin/Debug/*/c♯-slo.dll' >>dotnet
	chmod +x ./dotnet

dart:
	dart2native slo.dart -o dart

crystal:
	crystal build slo.cr -o crystal

clean:
	rm $(TARGETS) slo.class Point.class

.PHONY: all run clean
