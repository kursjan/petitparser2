---
title: Parsing with PetitParser2 
layout: default
---
# Parsing with PetitParser2

In this blog we describe [PetitParser2](https://github.com/kursjan/petitparser2) --- a modular and flexible high-performance top-down parsing framework.

## Structure

### Introduction
This introduction describes basics of PetitParser2 and how to migrate from PetitParser to PetitParser2.

There are other tutorials for PetitParser. We recommend the following:
- [Writing Parser with PetitParser](https://www.lukas-renggli.ch/blog/petitparser-1) from Lukas Renggli.
- [PetitParser chapter](http://scg.unibe.ch/archive/papers/Kurs13a-PetitParser.pdf) in the [Deep into Pharo](http://www.deepintopharo.com/) book.
- [Introduction to PetitParser2](http://www.humane-assessment.com/blog/introducing-petitparser2/) by Tudor Girba.


### Development Guide
Describes full cycle of parser development.
Starts from scripting in a playground and ends with a full-fledged, tested and high-performance parser. 
Covers topics such as tolerant parsing, abstract-syntax tree, optimizations and debugging.

<!--
## Uniqe Features of PetitParser2
We cover many topics, some of them well-known in the area of parsing, nevertheless, the following technologies are unique for PetitParser:
- **Bounded seas** is a technology that allows a programmer to focus on the interesting parts of an input (i.e. Javascript code in our case) and ignore the rest (i.e. the remaining HTML code).
- **Context-sensitive rules** that allow us to detect matching begin and end HTML tags and recover from malformed inputs.
- **Optimizations** of PetitParser to turn our prototype into a an efficient top-down parser. 
-->

## Getting Started

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

## Changelog
- *2019-12-30* - Introduction to PetitParser2.
- *2018-10-10* - Minor text tweaks, turned to Markdown and Jekyll on GitHub pages.
- *2017-02-21* - First draft of he Developer's workflow 

## TODO
{% include todo.html content="Parsing Streams" %}

<!--
{% include todo.html content="
Smalltalk parser

On a concrete example of a Smalltalk grammar, we describe how to develop a parser whose performance is comparable to a table-driven parsers such as [SmaCC](https://github.com/ThierryGoubier/SmaCC) or hand-written parsers such as RBParser (a parser used by Pharo compiler).
@@todo add some graphs?
"%}
-->

<!--
{% include todo.html content="Syntax Highlighting " %}
-->

## License
The text is released under the [MIT license]({% link LICENSE.md %}).

## Contact
Do you have ideas, suggestions or issues? Write me an email (<kurs.jan@gmail.com>), or contact us on [github](github.com/kursjan/petitparser2/issues)!
