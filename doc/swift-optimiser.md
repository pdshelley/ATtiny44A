# How the swift optimiser works

Just some brief thoughts. If useful!

### background

High level, not everyone knows this, swift has a slightly different structure from most llvm languages. It includes an extra representation stage called SIL. Swift Intermediate Language. It's half way between Swift itself and LLVM Intermediate Language (aka Bitcode).

The usual structure for an llvm compiler, such as Rust, Go, Fortran, Clang, etc. is... Parse -> Sema -> LLVM (-> optimisation -> MC / asm....)

That means, first the language parser / lexer runs, like any compiler, it scans the text for words, punctuation, etc. and tries to recognise keywords, build up a table of variable/function names, etc. then the semantic analsysis runs that tries to work out what all the names mean, looks up function names in external modules, etc., finally, the last bit of the front end is the code structures created to this point are "emmitted" into a bitcode program, including all the relevant extra language furniture, like garbage collection, etc. that the specific language needs and the front end then writes out bitcode.

Usually the front end then hands control to LLVM itself, which optimises the bitcode before writing it out to a file or handing the bitcode directly to the back end in memory.

The next steps are done in the back end, which is architecture specific. This is the bit that knows your architecture, it does a lot of arch specific optimisations and wrangling and finally outputs Machine Code or assembly.

Mostly the compiler runs all the way through and outputs machine code.

In Apple's case, there are a lot of optimisations done in SIL.

Swift does this...

Parse -> Sema -> SILGen -> [simple optimisations] -> SIL -> [complex optimisations] -> SIL -> LLVM


So all the optimisations you've seen are done in the SIL layers.

