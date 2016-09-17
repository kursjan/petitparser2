tests
testTwoParentsNoWarning
	| tokenOne tokenTwo |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).

	tokenOne := parser token.
	tokenTwo := parser token.
	sequence := tokenOne, tokenTwo.
	
	self visit: sequence.
	
	self assert: parser warnings isEmpty.
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer.