tests
testTwoParents
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).

	token := parser token.
	sequence := token, parser.
	
	self visit: sequence.
	
	self assert: parser warnings size equals: 1.
	self assert: parser strategy isKindOf: PP2StarPredicateObject.