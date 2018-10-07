# StarLazy 


{% include todo.html content="
todo(kurs): say more about sea as well.

todo(kurs): this chapter is pretty dense even for me, simplify...

todo(kurs): compare to lazy repetitions.
"%}

In this section, we shortly inspect how does the ```startLazy``` operator works. 
The code  ```parser starLazy``` is a shorthand for the following:

```smalltalk
^ (#epsilon asPParser sea)
  waterToken: parser;
  yourself
```

The island of the sea is ```#epsilon```. 
Such an island will be always found, because it accepts an empty string. 
Furthermore it will be surrounded by water that consumes anything until the next parser succeeds. 
You specify contents of a water by setting the ```waterToken```. 
By default you can use ```#any asPParser```. 
This means that the sea moves character by character betwen tests if the next parser succeeds. 

Yet as we have seen in the case of the ```javascript``` rule in the [Extracting Javascript](scripting.md) chapter, invoking ```#any asPParser``` may not be sufficient, the water can get confused by an end tag hidden in a string. 
Therefore, bounded seas allow you to define tokens that are expected in water. 
Such token can be a string or a comment and thus does not confuse the parser. 
In our case the tokens are either ```jsString``` or any character:

```smalltalk
^ (#epsilon asPParser sea)
  waterToken: jsString / #any asPParser;
  flatten
```

We have missed one detail.
The actual implementation of ```starLazy``` actually extracts only before water:

<!--
t sourceFor: #starLazy in: PP2Node.
-->
```smalltalk
PP2Node>>starLazy
  ^ ((#epsilon asPParser sea)
    waterToken: self)
  map: [:_before :_epsilon :_after | 
    "return just before water, because island is nil and after water is empty"
    _before
  ] 
```

If your island is parse an empty string (e.g. island is optional, zero or more repetitions or simply epsilon), seas postpone the epsilon parse as far as possible, until the boundary is found.
Therefore, in case of ```starLazy```, all the consumed input is in the before water and after water is empty.
