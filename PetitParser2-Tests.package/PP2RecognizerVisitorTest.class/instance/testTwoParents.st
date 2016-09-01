tests
testTwoParents
	parser := #letter asParser2 star.
	parser strategy: (PP2StarPredicateObject on: parser).

	token := parser token.
	sequence := token, parser.
	
	self visit: sequence.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObject.
	self deny: parser strategy isKindOf: PP2StarPredicateObjectRecognizer.