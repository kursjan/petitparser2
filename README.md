# PetitParser2 [![Build Status](https://travis-ci.org/kursjan/petitparser2.svg?branch=master)](https://travis-ci.org/kursjan/petitparser2)

PetitParser2 is a new version of [PetitParser](http://www.lukas-renggli.ch/blog/petitparser-1) that allows one to define flexible and high-performance parsers.

## Key Features
- Modular, composable and easy to extend
- Natural, easy-to-follow definitions
- High performance
- Supports context-sensitive parsing
- Supports tolerant parsing
- Rich IDE support

## Why to switch from PetitParser to PetitParser2?

### Better performance 
The performance of PetitParser2 is 2-5 times faster compared to PetitParser when used in optimized mode. The optimizations are based on the technologies of [PetitCompiler](http://scg.unibe.ch/scgbib?query=Kurs16a&display=abstract). To optimize, simply call `optimize` before `parse:`.

Try it out! Compare the optimized version of `PP2SmalltalkParser`, non-optimized version, `SmaCC` and `RBParser`. Evaluate the following code:
```smalltalk
PP2Benchmark exampleSmalltalk
```
### Much faster context-sensitive parsing
PetitParser2 applies many optimizations to reduce the overhead of context-sensitive combinators, when used in optimized mode.

### Support for real streams
PetitParser2 supports real streams - no need to have the whole input in memory (see `PP2BufferStream`). The following demo utilizes a parser created on top of a character stream coming from your keystrokes. The parser waits for input from the keyboard and proceeds with parsing as characters come in:

```smalltalk
PP2ReadKeysExample example
```

### Support for bounded seas
With PetitParser2 you can define only part of the grammar and skip an uninteresting input. Bounded seas are extensible so you can always add more rules to your grammar to extract more data.


## Installing PetitParser2

Use the configuration manager in your Pharo image and install the stable version.

Installing standard version for the latest Pharo:

```smalltalk
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

To install graphical tools (with `GToolkit` and `Roassal2` dependencies):

```smalltalk
Metacello new
    baseline: 'PetitParser2Gui';
    repository: 'github://kursjan/petitparser2';
    load.
```

To install experimental tools, e.g., RewriteEngine, use:

```smalltalk
Metacello new
    baseline: 'PetitParser2Experimental';
    repository: 'github://kursjan/petitparser2';
    load.
```

To install a core with minimal external dependencies, use:

```smalltalk
Metacello new
    baseline: 'PetitParser2Core';
    repository: 'github://kursjan/petitparser2';
    load.
```

## Debugging Parsers

[Here](https://github.com/kursjan/petitparser2/issues/20#issuecomment-399667230) you can find an illustrative explanation how to debug when parsers do not work as expected.

## [PetitParser2 Book](https://kursjan.github.io/petitparser2/pillar-book/build/book.html)
Learn more about PetitParser. In the book we cover all the topics related to PetitParser. We discuss basics of parsing such as testing or AST generation as well as advanced topics including context-sensitive parsing or optimizations.

https://kursjan.github.io/petitparser2/pillar-book/build/book.html

## Need Help?
Feel free to [open an issue](https://github.com/kursjan/petitparser2/issues) or post a [StackOverflow](https://stackoverflow.com/questions/tagged/petitparser2) question with the `petitparser2` tag.
