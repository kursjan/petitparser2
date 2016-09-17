tests
testToken
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 