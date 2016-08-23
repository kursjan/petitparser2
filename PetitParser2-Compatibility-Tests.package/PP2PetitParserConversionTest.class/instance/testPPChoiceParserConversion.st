test - conversion
testPPChoiceParserConversion
	| converted parser child1 child2 |

	child1 := $a asParser.
	child2 := $b asParser.
	parser := child1 / child2.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2ChoiceParser).
	self assert: (converted firstChild = child1).
	self assert: (converted secondChild = child2).	
	self deny: (converted children == parser children).