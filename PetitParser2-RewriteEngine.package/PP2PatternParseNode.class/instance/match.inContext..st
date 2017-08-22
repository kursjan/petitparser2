matching
match: otherParseNode inContext: aDictionary
    | parseNode |
    parseNode := aDictionary at: self ifAbsentPut: [ otherParseNode ].

	"
		JK: I have no idea if matching by source is a good idea or not. SmaCC doe not do this.
		PP2 does, because we want PP2ExpressionGramamr to work. E.g. `primary ('12')` should 
		match `terms ( primary ('12') )`: they both parse the same input, though the parse tree
		is different.
	"
    ^ (otherParseNode = parseNode or: [ otherParseNode source = parseNode source ])
        and: [ patternToken testBlock value: parseNode ]