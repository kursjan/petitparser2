# Writing Parsers with PetitParser2
This tutorial is based on [Writing Parser with PetitParser](https://www.lukas-renggli.ch/blog/petitparser-1) from Lukas Renggli.

PetitParser is a parsing framework different to many other popular parser generators. 
For example, it is not table based such as [SmaCC](https://github.com/SmaCCRefactoring/SmaCC) or [ANTLR](https://www.antlr.org/). 
Instead it uses a unique combination of four alternative parser methodologies: scannerless parsers, parser combinators, parsing expression grammars and packrat parsers. 
As such PetitParser2 is more powerful in what it can parse and it arguably fits better the dynamic nature of Smalltalk. 
Let’s have a quick look at these four parser methodologies:

- *Scannerless Parsers* combine what is usually done by two independent tools (scanner and parser) into one. This makes writing a grammar much simpler and avoids common problems when grammars are composed.
- *Parser Combinators* are building blocks for parsers modeled as a graph of composable objects; they are modular and maintainable, and can be changed, recomposed, transformed and reflected upon.
- *Parsing Expression Grammars* (PEGs) provide ordered choice. Unlike in parser combinators, the ordered choice of PEGs always follows the first matching alternative and ignores other alternatives. Valid input always results in exactly one parse-tree, the result of a parse is never ambiguous.
- *Packrat Parsers* give linear parse time guarantees and avoid common problems with left-recursion in PEGs.

## Writing a Simple Grammar
Writing grammars with PetitParser is simple as writing Smalltalk code. 
For example to write a grammar that can parse identifiers that start with a letter followed by zero or more letter or digits is defined as follows. 
In a workspace we evaluate:

```smalltalk
identifier := #letter asPParser , #word asPParser star.
``` 

If you inspect the object identifier you’ll notice that it is an instance of a PP2SequenceNode. 
This is because the #, operator created a sequence of a letter and a zero or more word character parser. 
If you dive further into the object you notice the following simple composition of different parser objects:

```
PP2SequenceNode (this parser accepts a sequence of parsers)
    PP2PredicateObjectNode (this parser accepts a single letter)
    PP2RepeatingNode (this parser accepts zero or more instances of another parser)
       PPPredicateObjectNode (this parser accepts a single word character)
```

## Parsing Some Input
To actually parse a string (or stream) we can use the method `#parse:`:

```smalltalk
identifier parse: 'yeah'.          " --> #($y #($e $a $h)) "
identifier parse: 'f12'.           " --> #($f #($1 $2)) "
```

While it seems odd to get these nested arrays with characters as a return value, this is the default decomposition of the input into a parse tree. 
We’ll see in a while how that can be customized.

If we try to parse something invalid we get an instance of `PP2Failure` as an answer:

```smalltalk
identifier parse: '123'.           " --> letter expected at 0 "
```

Instances of PP2Failure are the only objects in the system that answer with true when you send the message `#isPetitFailure`. 
Alternatively you can also use `#parse:onError:` to throw an exception in case of an error:

```smalltalk
identifier
   parse: '123'
   onError: [ :msg :pos | self error: msg ].
```

If you are only interested if a given string (or stream) matches or not you can use the following constructs:

```smalltalk
identifier matches: 'foo'.         " --> true "
identifier matches: '123'.         " --> false "
```

## Different Kinds of Parsers
PetitParser2 provides a large set of ready-made parser that you can compose to consume and transform arbitrarily complex languages. 
The terminal parsers are the most simple ones. 
We’ve already seen a few of those:

<table>
<tr><th>Terminal Parsers</th><th>Description</th></tr>
<tr><td>$a asPParser</td><td>	Parses the character $a.</td></tr>
<tr><td>'abc' asPParser</td><td>	Parses the string 'abc'.</td></tr>
<tr><td>#any asPParser</td><td>Parses any character.</td></tr>
<tr><td>#digit asPParser</td><td>Parses the digits 0..9.</td></tr>
<tr><td>#letter asPParser</td><td>Parses the letters a..z and A..Z.</td></tr>
</table>

The `PP2NodeFactory` provides a lot of other factory methods that can be used to build more complex terminal parsers.

The next set of parsers are used to combine other parsers together:

<table>
<tr><th>Parser Combinators</th><th>Description</th></tr>
<tr><td>p1 , p2</td><td>Parses p1 followed by p2 (sequence).</td></tr>
<tr><td>p1 / p2</td><td>Parses p1, if that doesn’t work parses p2 (ordered choice).</td></tr>
<tr><td>p star</td><td>Parses zero or more p.</td></tr>
<tr><td>p plus</td><td>Parses one or more p.</td></tr>
<tr><td>p optional</td><td>Parses p if possible.</td></tr>
<tr><td>p and</td><td>Parses p but does not consume its input.</td></tr>
<tr><td>p not</td><td>Parses p and succeed when p fails, but does not consume its input.</td></tr>
<tr><td>p end</td><td>Parses p and succeed at the end of the input.</td></tr>
</table>

Instead of using the #word predicated we could have written our identifier parser like this:

```smalltalk
identifier := #letter asPParser , (#letter asPParser / #digit asPParser) star.
```
To attach an action or transformation to a parser we can use the following methods:

<table>
<tr><th>Action Parsers</th><th>Description</th></tr>
<tr><td>p ==> aBlock</td><td>Performs the transformation given in aBlock.</td></tr>
<tr><td>p flatten</td><td>Creates a string from the result of p.</td></tr>
<tr><td>p token</td><td>Creates a token from the result of p.</td></tr>
<tr><td>p trim</td><td>Trims whitespaces before and after p.</td></tr>
</table>
To return a string of the parsed identifier, we can modify our parser like this:

```smalltalk
identifier := (#letter asPParser , (#letter asPParser / #digit asPParser) star) flatten.
```

These are the basic elements to build parsers. 
There are a few more well documented and tested factory methods in the operations protocol of PP2Node. 
If you want browse that protocol.

## Writing a More Complicated Grammar
Now we are able to write a more complicated grammar for evaluating simple arithmetic expressions. 
Within a workspace we start with the grammar for a number (actually an integer):

```smalltalk
number :=  #digit asPParser plus token trim ==> [ :token | token value asNumber ].
```

Then we define the productions for addition and multiplication in order of precedence. 
Note that we instantiate the productions as PP2UnresolvedNode upfront, because they recursively refer to each other. 
The method `#def:` resolves this recursion using the reflective facilities of the host language:

```smalltalk
term := PP2UnresolvedNode new.
prod := PP2UnresolvedNode new.
prim := PP2UnresolvedNode new.
 
term def: (prod , $+ asPParser trim , term ==> [ :nodes | nodes first + nodes last ])
   / prod.
prod def: (prim , $* asPParser trim , prod ==> [ :nodes | nodes first * nodes last ])
   / prim.
prim def: ($( asPParser trim , term , $) asPParser trim ==> [ :nodes | nodes second ])
   / number.
```

To make sure that our parser consumes all input we wrap it with the end parser into the start production:

```smalltalk
start := term end.
```

That’s it, now we can test our parser and evaluator:

```smalltalk
start parse: '1 + 2 * 3'.       " --> 7 "
start parse: '(1 + 2) * 3'.     " --> 9 "
```

As an exercise we could extend the parser to also accept negative numbers and floating point numbers, not only integers. 
Furthermore it would be useful to add support subtraction and division as well. 
All these features can be added with a few lines of PetitParser2 code.
