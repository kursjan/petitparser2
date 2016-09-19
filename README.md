# PetitParser2 [![Build Status](https://travis-ci.org/kursjan/petitparser2.svg?branch=master)](https://travis-ci.org/kursjan/petitparser2)

PetitParser2 is a new version of [PetitParser](http://www.lukas-renggli.ch/blog/petitparser-1) that allows to define flexible and high-performance parsers.

## Key Features
- Modular, composable and easy to extend
- Natural, easy-to follow grammar definitions
- High performance
- Supports sensitive-parsing [TBD]
- Supports bounded seas [TBD]
- Contains dedicated browser and debugger

## Why to switch from PetitParser to PetitParser2?

### Better performance 
The performance of PetitParser2 is 2-5 times better compared to PetitParser, when used in optimized mode. The optimizations are based on the technologies of [PetitCompiler](http://scg.unibe.ch/scgbib?query=Kurs16a&display=abstract). To optimize, simply call `optimize` before `parse:`.

Try it out!. Compare the optimized version of `PP2SmalltalkParser`, non optimized version, `SmaCC` and `RBParser`. Evaluate the following code:
```
PP2Benchmark exampleSmalltalk
```
### Much faster context-sensitive parsing
TBD

### Support for real streams
PetitParser2 supports real streams, no need to have the whole input in memory (see `PP2BufferStream`). The following demo utilizes a parser created on top of a character stream comming from your keystrokes. The parser waits for input from the keyboard and proceeds with parsing as characters comes in:

```
PP2ReadKeysExample example
```

### Support for bounded seas
TBD


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
