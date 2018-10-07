# Manual Memoization

{% include note.html content="
The ```WebGrammar``` you see in the Pharo image already contains optimized version of the ```element``` rule. 
In this chapter we suppose that ```element``` definition looks like defined in [Extracting the Structure](csgrammar.md) chapter, i.e. it looks like this:
```smalltalk
WebGrammar>>element
  ^ (elOpen, elContent, elClose)
```
"%}

In the previous [chapter](optimizations.md) we greatly improved the performance of our parser by calling ```optimize``` method. 
Let's try the real sources then.
The home page of we [wikipedia](https://wikipedia.org), [github](https://github.com), [facebook](https://facebook.com) and [google](https://google.com) can be parsed invoking this commands:

```smalltalk
sources := PP2Sources current htmlSourcesAll.
parser := WebParser new optimize.
sources collect: [ :s |
	parser parse: s.
]
```

Unfortunately, this still takes too much (event with the automated optimizations). 
Can we do something, that the optimizations can't? 
Usually, hard to say. 
It depends on the nature of a grammar and input to be parsed.
In this case, we can really improve the performance (obviously, we wouldn't write this chapter otherwise).

### Trace View
It is a good time to check the events morph of a debug result. 
Events morph shows timeline of parser invocations (dot) at a given position (x axis) in a given time (y axis).
Inspect the result of the following command again and switch to *Events* view.

```smalltalk
WebParser new optimize debug: input.
```

<a id="optimizedTrace" />
![Visualization of invocations of the optimized parser on input](img/optimized-trace.png)

On the screenshot in there is only a part of the story (the part that fits into a single window).
The whole story is that parsing progress fast towards the end of input (this is the good part),  but suddenly parser jumps back to the beginning of input and starts again. 
Over and over again (this is the bad part).

{% include note.html content="
For long inputs the *Event* tab shows only a beginning of the input and first few thousands of invocations.
"%}

Even though optimizations in PetitParser2 work reasonably well, not all of them can be applied automatically and must be done by poor humans.
Luckily, there are tools to help those humans. 

For the convenience of the visualization, we will use a compacted and simplified input.
```smalltalk
compact := '
<!a>
<h>
<m foo>
<m e>
<b>
Lorem ipsum donor sit amet
</b>
</h>
'.
WebParser new optimize debug: compact.
```

<a id="compactTrace" />
![Visualization of invocations of the optimized parser on compact input](img/short-trace.png)


## Searching for the cause

In the events morph we see how does the parser backtrack, over and over. 
We have to do a bit of detective work to figure out when and why. 
Let us navigate through the parsing until the HTML body (represented by the ```b``` element in the *compact* input) is parsed:



![Debug view of the ```element``` rule](img/optimized-debug-element.png)


Now switch to the traces tab:

![Debug view of the ```element``` rule, traces tab](img/optimized-trace-element.png)

The yellow rectangle in the preivious figure highlights 872 underlying invocations of the ```element``` rule. 
The dark red rectangle highlights another invocations of the same ```element``` rule that started at the same position. 
And we see there are quite a few of them. 

In general, one does not want to see repeating dark-red rectangles, and the more of them or the higher these dark-red rectangles are, the worse. 
It simply means redundant computations. 
Remember, each pixel on the y-axis is a parser invocation.


{% include note.html content="
Why do these redundant invocations happen? 
Because of the unclosed HTML ```meta``` elements (represented by ```m``` in the *compact* input). 
The parser sees meta, starts an element, parses the content of meta, including the body element. 
But it does not find the closing meta. 
So it returns before the meta element, skips the meta part as a water and continues parsing. 
This means it re-parses the body element again. 
The more ```meta``` elements, the worse.
"%}

{% include note.html content="
If you are watchful, you might have noticed a line behind a dark-red bar. 
This line is created by automated cache, which immediately returns the result of a ```body``` element and prevents the whole execution.
But because it can remember only the last result, it can prevent only half of the executions.
Twice as fast is good, but we can do even better.
"%}

## Fixing the Cause
Solution to this case is called memoization. 
To suggest PetitParser2 to add memoization, add a ```memoize``` keyword to the ```element``` rule.

{% include note.html content="
Memoization is a technique to remember all the results for all the positions (while caching remembered only the last result for the last position).
Memoizations are costly as well, therefore they should be applied carefully.
"%}

```smalltalk
WebGrammar>>element
	^ (elOpen, elContent, elClose)
		memoize;
		yourself
```
<!--
@@note Please note currently PetitParser2 does not support memoizations of push and pop parsers. The *"neutral"* parsers, for example a sequence of push and pop, as in the case of the ```element``` rule, can be memoized.
-->

Let us check the result now:

```smalltalk
WebParser new optimize debug: compact.
```


![Memoized trace of a compact input](img/memoized-trace.png)

The shows what we want to see: no repeated invocations, no superfluous backtracking. 


{% include note.html content="
Parser still backtracks: it is because of the nature of the grammar. 
Grammar is defined to speculate so it speculates. 
We see two big backtrackings: one for each ```meta``` in the input, the html body itself is not re-parsed over and over again and the precious time is saved.
"%}

{% include note.html content="
Pro tip: If you want to avoid backtracking of ```meta``` elements, you have to include syntax of ```meta``` into the grammar.
"%}

## Parsing Real Sources
Finally, we can parse big sources as well, they should be parsed in a reasonable time now:

```smalltalk
sources := PP2Sources current htmlSourcesAll.
parser := WebParser new optimize.
sources collect: [ :s |
	parser parse: s.
]
```

## Conclusion
Momoziation reduced exponential parsing time complexity to a linear complexity.
Memoization is hard to apply automatically, therefore PetitParser2 provides tools to identify which parsers should be memoized.

### Sources
The sources of this tutorial are part of the PetitParser2 package, you just need to install PetitParser2 or use Moose as described in the [Introduction](index.md).
