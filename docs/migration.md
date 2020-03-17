# Migration from PetitParser

Why should you migrate to PetitParser2? 
If you find one of these interesting:

### Actively Maintained
PetitParser2 is still actively maintained. 
By the author of PetitParser2 and by the Moose community.

### Same as PetitParser
PetitParser2 can express everything PetitParser can and more.
For example, there are predicates such as `#startOfLine`, `#endOfLine`, which are not available in PetitParser.

### Better performance 
The performance of PetitParser2 is 2-5 times better compared to PetitParser. 
The optimizations are based on our experience with [PetitCompiler](http://scg.unibe.ch/scgbib?query=Kurs16a&display=abstract).

Try it out! Compare the optimized version of `PP2SmalltalkParser`, non-optimized version, `SmaCC` and `RBParser`. Evaluate the following code:
```smalltalk
PP2Benchmark exampleSmalltalk
```

You can see that PetitParser2 is as fast as SmaCC while having all the advantages of PetitParser. 
PP2 parsers can be optimized by calling `optimize` method on the resulting parser.

### Works with streams
PetitParser2 supports real streams: no need to load the whole input into the memory (see `PP2BufferStream`). 
Try to parse an input comming from your keystrokes. 
The following parser waits for the input from a keyboard does parsing as characters come in:

```smalltalk
PP2ReadKeysExample example
```

If you want to use Zinc stream, try `PP2HtmlHeaderGrammar`, which can read headers of the web page, without downloading the whole page:
```smalltalk
PP2HtmlHeaderGrammar example
```

### Support for bounded seas
With PetitParser2 you can define only part of the grammar and skip the rest. 
With bounded seas you define islands of interest only. 
Bounded seas will skip the undefined input and return only islands.
For example, you can easily [extract JavaScript from HTML pages](https://kursjan.github.io/petitparser2/scripting.html).

### Support for context-sensitive rules
With PetitParser2 you can parse more languages than PEGs can express. 
PetitParser2 contains an extension for parsing context sensitive grammars. 

## Differences to PetitParser 
How is PetitParser2 different to PetitParser?
To increase performance, PetitParser2 decouples the parsing strategy from the parser structure while preserving the PetitParser interface.
The parsing strategy is replaced behind the scenes and is mostly transparent for the end user.

The differences are:
- Parsers are subclass of `PP2Node`, not `PPParser`.
- Failure is instance of `PP2Failure`, not `PPFailure`. Failures are created using `asPetit2Failure`, not `asPetitFailure`.
- Terminal parsers are created using `asPParser` method, not `asParser`.
- Complex grammars are defined by subclassing `PP2CompositeNode`, not `PPCompositeParser`.
- Many other objects from PetitParser have their PetitParser2 equivalent with `PP2` prefix.


## Restrictions
- `PP2CompositeNode` does not support `dependencies` as `PPCompositeParser`. 
I am not aware of any use-case for dependencies, so I didn't migrated the functionality.
[Let me know](https://github.com/kursjan/petitparser2/issues) if there is a use-case for you.
