# Context-Sensitive Parsing

Context-sensitive parsing is a process during which a parser has to remember some information and its result depends on its information.
We saw an example with the HTML open and close tags in *Extracting the Structure>Chapters/chapter3.pillar* chapter.

The ```elClose``` rule is context-sensitive, because the result of ```elClose``` when parsing, for example, input ''body'', depends on an information remembered by ```elOpen```.
The ```elOpen``` rule is also context-senstive, because it changes the information.

Another example of context-sensitive rules is indentation of Python, or body of HTML request whose length depends on the value in the header.

Though natural for humans, the context-sensitive parsing is, surprisingly, rather difficult task from the parsing theory point of view.


## Matching Open And Close Tags
Let us return to our example of matching open and close tags.
One of the standard solutions provided by many parsing frameworks, including PetitParser, are parsing actions. 
We define an action that asserts the name of an open tag corresponds to the name of a close tag:

```smalltalk
WebGrammar>>elOpen
  ^ '<' asPParser, identifier, '>' asPParser

WebGrammar>>elClose
  ^ '</' asPParser, identifier, '>' asPParser

WebGrammar>>element
  ^ elOpen, content, elClose
 
  "define parsing action:"
  map: [:_open :_content :_close |
  (_open = _close) ifTrue: [
   _content
  ] ifFalse: [ 
   PP2Failure message: ‘open and close do not match’.
  ]
```

This solution works well, if you want to validate if an input is valid.
But it will fail for invalid inputs, for example for inputs with unclosed elements:

```smalltalk
<b><i>bold and italics</b>
```

The first ```elOpen``` consumes ''\<b\>'', 
the second ```elOpen``` consumes 
''\<i\>'', 
content consumes *bold and italics* and 
```elClose``` consumes *\</b\>*. 
The action checks if ''i = b'' and returns failure. 
The failure will be the final result because such a code does not restore position to recover from the failure and actions do not offer a way to do so. 
Other options based on custom parsers or wrapping parsers will sooner or later run into a hard to debug issues with backtracking as well.


{% include todo.html content="does this work with GLL?" %}

The PetitParser2 offers more formal way of such definitions. 
It can store a result of a rule (e.g. ```elOpen```) onto a stack using the push operator and assert that the result of a rule (e.g. ```elClose```) matches the top of the stack using the match operator and finally pop the result using the pop operator. 
Here is the concrete example. 


First we define an element name as a repetition of letters and digits:

```smalltalk
WebGrammar>>elementName
  ^ #word asPParser plus flatten
```

Than we define element as a sequence of ```elOpen```, ```elContent``` and ```elClose```:

```smalltalk
WebGrammar>>element
  ^ (elOpen, elContent, elClose)
```

In ```elOpen```, we push the element name as well as we consume water in case an element contains arguments:

```smalltalk
WebGrammar>>elOpen
  ^ $< asPParser, elementName push, #any starLazy, $> asPParser ==> #second
```

In ```elClose```, we first match the element name against the top of a stack and we pop the stack in case of success:

```smalltalk
WebGrammar>>elClose
  ^ '</' asPParser, elementName match pop, $> asPParser
```
