grammars
grammarA
	"A highly recrusive grammar."

	| grammar |
	grammar := PP2UnresolvedNode new.
	grammar def: (grammar , $+ asPParser , grammar) / $1 asPParser.
	^grammar