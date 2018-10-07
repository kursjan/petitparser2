---
title: Parsing with PetitParser2 
layout: default
---
# Parsing with PetitParser2

In this series we describe [PetitParser2](https://github.com/kursjan/petitparser2) --- a modular and flexible high-performance top-down parsing framework.

## Structure

The text is organized into two parts: 
1. The first part covers the basic developer's workflow with PetitParser.  It is suitable for anyone who has a bit of experience with PetitParser and would like to learn how to efficiently develop production quality parsers with PetitParser.
1. The second part covers advanced topics and inspects internals of PettiParser into more depth. It is for those who would like to fully levereage capatbilities of PetitParser to better fit their needs.

### Prerequsities
This text expects a basic knowledge of parsing with PetitParser.
If you are not sure, if you have the required level of knoledge, we recommend the following:
- [Writing Parser with PetitParser](https://www.lukas-renggli.ch/blog/petitparser-1) from Lukas Renggli.
- [Introduction to PetitParser2](http://www.humane-assessment.com/blog/introducing-petitparser2/) by Tudor Girba.
- Optionally, there is a dedicated [PetitParser chapter](http://scg.unibe.ch/archive/papers/Kurs13a-PetitParser.pdf) in the [Deep into Pharo](http://www.deepintopharo.com/) book.


### Part I: Developer's Workflow
In part I we quickly build a high-performance parser extracting a Javascript code from any HTML source and we add error recovery if the source is malformed.

From prototyping in a playground we reach a full-fledged and tested parser that effectively builds a structured HTML representaion. 
We cover many topics, some of them well-known in the area of parsing, nevertheless, the following technologies are unique for PetitParser:
- **Bounded seas** is a technology that allows a programmer to focus on the interesting parts of an input (i.e. Javascript code in our case) and ignore the rest (i.e. the remaining HTML code).
- **Context-sensitive rules** that allow us to detect matching begin and end HTML tags and recover from malformed inputs.
- **Optimizations** of PetitParser to turn our prototype into a an efficient top-down parser. 

In [Extracting Javascript](scripting.md) we start with a simple script.
Later in [From a Script to a Parser](Chapters/chapter2.pillar), we turn the script into a proper grammar and add tests.
In [Extracting the Structure](Chapters/chapter3.pillar) we extend the parser with rules to recognize HTML structure, even if the HTML source is malformed. In [Abstract Syntax Tree](Chapters/AST.pillar), we show how to build a suitable representation of the HTML source.

In [Optimizations](Chapters/optimizations.pillar) we inspect optimizations capabilities of PetitParser2
and in [Memoizations](Chapters/memoization.pillar) we describe tooling of PetitParser2 that will help us to pinpoint the performance bottlenecks and we show techniques how to fix them.


### Part II, Advanced Topics
TODO(kurs): clean the links here!

We cover in details the following topics:
- context-sensitive parsing
- optimizations with caches and specializations


#### TODO
- parsing streams; and
- syntax higlighting


On a concrete example of a Smalltalk grammar, we describe how to develop a parser whose performance is comparable to a table-driven parsers such as [SmaCC](https://github.com/ThierryGoubier/SmaCC) or hand-written parsers such as RBParser (a parser used by Pharo compiler).

@@todo add some graphs?

TODO(kurs): fix links
- [Matching Tags](../matchingTags.pillar)
- [Caches in Detail](../caches.pillar)

@@todo create a chapter about syntax highlighting

@@todo create a chapter about specializations 
- [Specializations in Detail](../smalltalkOptimization.pillar)

## Getting Started

### Installation
The easiest way to start this tutorial is to use [Moose](http://moosetechnology.org). 
Moose is a software and data analysis platform that has everything we need already installed.

Alternatively, you can download clean [Pharo 6](http://pharo.org) (or higher) image and install PetitParser2 using the following command:

```smalltalk
Metacello new
	baseline: 'PetitParser2Gui';
	repository: 'github://kursjan/petitparser2';
   	load
```

In case it does not work, please let me know: <kurs.jan@gmail.com>. 


### Book Chapters
The list of available chapters:
- [Extracting Javascript](Chapters/chapter1.pillar)
- [From a Script to a Parser](Chapters/chapter2.pillar)
- [Extracting the Structure](Chapters/chapter3.pillar)
- [Abstract Syntax Tree](Chapters/AST.pillar)
- [Optimizations](Chapters/optimization.pillar)
- [Memoization](Chapters/memoization.pillar)

@@note Part two is not yet finished
If you are interested in more details:
- [The ```starLazy``` operator](Chapters/starLazy.pillar)
- [Matching Tags](Chapters/matchingTags.pillar) (context-sensitive parsing)
- [Specializations in Detail](specializations.pillar)
- [Caches in Detail](caches.pillar)

## Changelog

- *2017-02-21* - First draft of he Developer's workflow 
- *2018-10-10* - Minor text tweaks, turned to markdown.

## License
The text is released under the [MIT license]({% link LICENSE.md %}).

## Contact
Do you have ideas, suggestions or issues? Write me an email (<kurs.jan@gmail.com>), or contact us on [github](github.com/kursjan/petitparser2/issues)!
