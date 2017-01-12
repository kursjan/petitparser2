# PetitParser2 [![Build Status](https://travis-ci.org/kursjan/petitparser2.svg?branch=master)](https://travis-ci.org/kursjan/petitparser2)

PetitParser2 is a new version of [PetitParser](http://www.lukas-renggli.ch/blog/petitparser-1) that allows to define flexible and high-performance parsers.

## Key Features
- Modular, composable and easy to extend
- Natural, easy-to follow definitions
- High performance
- Supports context-sensitive parsing
- Supports tolerant parsing
- Rich IDE support

## Why to switch from PetitParser to PetitParser2?

### Better performance 
The performance of PetitParser2 is 2-5 times better compared to PetitParser when used in optimized mode. The optimizations are based on the technologies of [PetitCompiler](http://scg.unibe.ch/scgbib?query=Kurs16a&display=abstract). To optimize, simply call `optimize` before `parse:`.

Try it out!. Compare the optimized version of `PP2SmalltalkParser`, non optimized version, `SmaCC` and `RBParser`. Evaluate the following code:
```
PP2Benchmark exampleSmalltalk
```
### Much faster context-sensitive parsing
PetitParser2 applies many optimizations to reduce the overhead of context-sensitive combinators, when used in optimized mode.

### Support for real streams
PetitParser2 supports real streams, no need to have the whole input in memory (see `PP2BufferStream`). The following demo utilizes a parser created on top of a character stream comming from your keystrokes. The parser waits for input from the keyboard and proceeds with parsing as characters comes in:

```
PP2ReadKeysExample example
```

### Support for bounded seas
With PetitParser2 you can define only part of the grammar and skip an uniteresting input. Bounded seas are extensible so you can always add more rules to your grammar to extract more data.


## Installing PetitParser2

Use the configuration manager in your Pharo image and install the stable version.

Installing a Development version of Pharo for the latest Pharo (with no guarantees):

```smalltalk
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load
```

Use the `PetitParser2-Headless` to avoid loading `GToolkit` and `Roassal2`:

```smalltalk
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load: 'PetitParser2-Headless'
```

## [PetitParser2 Book](https://kursjan.github.io/petitparser2/pillar-book/build/book.html)
Lear more about PetitParser. In the book we cover all the topics related to PetitParser. We discuss basics of parsing such as testing or AST generation as well as advanced topics including context-sensitive parsing or optimizations.

https://kursjan.github.io/petitparser2/pillar-book/build/book.html
