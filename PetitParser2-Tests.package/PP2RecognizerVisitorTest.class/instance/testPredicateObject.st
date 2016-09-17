tests
testPredicateObject
	parser := #letter asPParser.
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2PredicateObjectRecognizer  