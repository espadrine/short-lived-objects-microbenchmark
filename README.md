I was amused by Jonathan Worthington's [Perl 6 performance update][] talk. At 31:42, he gives a microbenchmark focused on a specific optimization for short-lived objects implemented for Rakudo.

[Perl 6 performance update]: https://youtu.be/QNeu0wK92NE?t=1893

It seemed whimsical to implement it in a large number of languages to see how they fare.

The usual warnings apply: don't assume anything from those benchmarks without carefully investigating the binary representation of the compiled bytecode or assembly and the optimization passes that produced it.

## Performance

1. JS: 033 ms
2. OCaml: 037 ms
3. C: 038 ms
4. Common Lisp: 058 ms
5. Scheme: 124 ms
6. Go: 166 ms
7. Swift: 193 ms
8. Julia: 213 ms
9. Rust: 246 ms
10. Python: 379 ms
11. Java: 509 ms
12. Dart: 587 ms
13. Ruby: 659 ms
14. Perl6: 713 ms
15. C#: 1.312s
16. Haskell: 1.728s

As a reference, the precompiled programs had the following results:

1. Go (precompiled): 001 ms
1. OCaml (precompiled): 001 ms
1. C (precompiled): 003 ms
1. Swift (precompiled): 015 ms
2. Rust (precompiled): 037 ms
3. Java (precompiled): 047 ms
4. C# (precompiled): 072 ms
10. Haskell (precompiled): 452 ms

The precompiled programs are less interesting, because, given how fast the computation is, the binary's startup time becomes a significant factor. However, that time is only ever relevant for programs that are often started (such as in a CGI or serverless Lambda configuration), which is not the focus here.

Now, the subjective rankings:

## Writability

(Ease of getting from a blank slate to a compiled implementation, in terms of mental model, developer feedback loop, and ease to physically enter on a computer.)

1. JavaScript (quick feedback, clear mental model)
2. Swift (obvious apart from picking types, no boilerplate, the `swift` compile cycle is akin to `node` (I know it is not as fast for larger projects…). The "do many times" syntax is a bit peculiar.)
3. Perl6 (same as Swift, but with more line noise that is physically harder to type. There is a default constructor to fill in the class, which is nice.)
4. Dart (having to decide which syntax to use is distracting, but otherwise the same as Swift. The `main()` boilerplate feels extraneous, as does the explicit constructor which could be there by default.)
5. Go (there is no decision apart from types, the implementation is obvious and unique, the `go run` compile cycle is fast enough to feel just like the `node` cycle in JS, although having to write the `main()` boilerplate is not great and the shebang syntax is subtle.)
6. Rust (exactly the same as Go, except for having to specify mutability.  (Fortunately, there are no lifetime or cyclic data structures, which are a lot harder!))
7. OCaml (same as Rust, without the `main()` boilerplate. The mutable reference is a bit more in-your-face, but it is a strong part of the mental model once you have learnt the language. The syntax is a bit foreign: when do I need two semicolons again? Also, the shebang syntax is incompatible with compilation.)
8. Ruby (quick feedback, clear mental model, but the `attr_reader` thing is easy to forget.)
9. Python (the range looping is less intuitive than the Ruby version, otherwise identical.)
10. Common Lisp (quick feedback, but I had to look up the loop and format documentationagain, and running it as a shebang required a bit of searching.)
11. Scheme (nice feedback and small mental model that is easy to remember (compared to CL's loop), although it has more boilerplate than Common Lisp from the R6RS import.)
12. Julia (same as JS, but the inconsistent scoping model is baffling.)
13. Haskell (the syntax is widely inconsistent (eg. the data syntax, do let vs. let, looping with a function named `forM_` which is a bit hard to guess, dollars), the mutable references are even more in-your-face than OCaml, and there is boilerplate to display types.)
14. C (the typedef and printf syntax is distracting, there is useless boilerplate like headers, main, types and return 0.)
15. Java (huge boilerplate on types, classes, publicity, `String[] args` that we don't even use. The compilation feedback is not great)
16. C# (same as Java, without the `args` boilerplate, but with a more cumbersome tooling through the `dotnet` command which adds a lot of boilerplate files with no way to just compile that one file. The shebang is an art in absurdity.)

## Readability

1. Julia
2. Swift (more boilerplate than Julia.)
3. Rust (more boilerplate than Swift.)
4. JS (hard to guess types.)
5. Dart (more boilerplate than JS.)
6. Ruby (more explicit than Python, eg. "10 times" rather than "construct this list of integers and for each element…")
7. Python (more boilerplate than JS, hard to know which type is assigned and figure out a variable's scope at a glance: is it a definition or a reassignment?)
8. Go
9. OCaml (hard to know which type is assigned when not explicit.)
10. Common Lisp (hard to tell where expressions start and end at a glance.)
11.  Scheme (Same as Common Lisp, but with more boilerplate.)
12. Perl6 (More line noise in the middle of code than Scheme; less boilerplate than C.)
13. C (More boilerplate than Scheme.)
14. C# (More boilerplate than C.)
15. Java (More boilerplate than C#.)
16. Haskell (hard to figure out where expressions start and end; a lot of line noise can have severe changes in meaning.)

If we average the languages' rankings here is what we get:

## Overall

2. JS
3. Swift
6. OCaml, Rust (ex-aequo)
6. Go
7. Julia, Dart (ex-aequo)
8. Common Lisp
8. Python
9. Scheme, Ruby (ex-aequo)
9. Perl6
10. C
13. Java
15. C#, Haskell (ex-aequo)

## References

- JS: Node.js/V8 v12.3.1
- Swift: version 5.0.1 (swift-5.0.1-RELEASE)
- OCaml: version 4.08.1
- Rust: rustc 1.35.0 (3c235d560 2019-05-20)
- Go: go version go1.12.5 linux/amd64
- Julia: julia version 1.1.1
- Dart: Dart VM version: 2.4.1 (Unknown timestamp) on "linux_x64"
- Common Lisp: SBCL 1.4.5.debian
- Python: Python 2.7.15+
- Scheme: Chez Scheme Version 9.5.2
- Ruby: ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
- Perl6: This is Rakudo Star version 2019.03.1 built on MoarVM version 2019.03 implementing Perl 6.d.
- C: gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0
- Java: openjdk version "11.0.4" 2019-07-16; OpenJDK Runtime Environment (build 11.0.4+11-post-Ubuntu-1ubuntu218.04.3); OpenJDK 64-Bit Server VM (build 11.0.4+11-post-Ubuntu-1ubuntu218.04.3, mixed mode, sharing)
- C#: .NET Command Line Tools (2.2.401)
- Haskell: The Glorious Glasgow Haskell Compilation System, version 8.0.2
- Operating System: KDE neon User Edition 5.16 18.04 bionic

Performed on Intel(R) Core(TM) i5-8350U CPU @ 1.70GHz.
