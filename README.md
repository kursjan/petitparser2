# PetitParser2 [![Build Status](https://travis-ci.org/kursjan/petitparser2.svg?branch=master)](https://travis-ci.org/kursjan/petitparser2)

PetitParser2 is a framework for building parsers. PetitParser2 is a new version of [PetitParser](http://www.lukas-renggli.ch/blog/petitparser-1) with focus on performance and flexibility.

## Key Features
- Modular, composable and easy to extend
- Natural, easy-to-follow definitions
- High performance
- Rich IDE support

## Why to switch from PetitParser to PetitParser2?

There are many reasons why to switch to PetitParser2:
- PetitParser2 is actively maintained by the author and by the Moose community.
- PetitParser2 can do everything PetitParser can do, and more: for example it contains new predicates such as `#startOfLine`, `#endOfLine`, can express tolerant or context sensitive grammars.
- The performance of PetitParser2 is 2-5 times better compared to PetitParser. 
- PetitParser2 supports real streams: no need to load the whole input into the memory (see `PP2BufferStream`). 

We already migrated many parsers to PetitParser2 (e.g. Smalltalk, Pillar, ...). 
If you find anything that is not working for you, please [open an issue](https://github.com/kursjan/petitparser2/issues).
See [Migration from PetitParser](https://kursjan.github.io/petitparser2/migration.html) for more details.

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

To install a core with minimal external dependencies, use:

```smalltalk
Metacello new
    baseline: 'PetitParser2Core';
    repository: 'github://kursjan/petitparser2';
    load.
```

To install additional languages, use:

```smalltalk
Metacello new
    baseline: 'PetitParser2Languages';
    repository: 'github://kursjan/petitparser2';
    load.
```

The following grammars are available:
- Smalltalk
- CSV
- HTML
- JSON
- MSE
- ManifestMF

## [PetitParser2 Tutorial](https://kursjan.github.io/petitparser2/)
Learn more about PetitParser2. 
In the tutorial we cover all the topics related to PetitParser2. 
We discuss PetitParser2 best practices, testing, abstract syntax tree generation, optimizations or even context-sensitive parsing.

https://kursjan.github.io/petitparser2/

## Debugging Parsers

[Here](https://github.com/kursjan/petitparser2/issues/20#issuecomment-399667230) you can find an illustrative explanation how to debug when parsers do not work as expected.

## [Migration from PetitParser](https://kursjan.github.io/petitparser2/migration.html)


[More details](https://kursjan.github.io/petitparser2/migration.html).

## Need Help?
Feel free to [open an issue](https://github.com/kursjan/petitparser2/issues) or post a [StackOverflow](https://stackoverflow.com/questions/tagged/petitparser2) question with the `petitparser2` tag.
