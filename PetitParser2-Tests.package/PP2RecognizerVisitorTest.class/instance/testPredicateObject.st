tests
testPredicateObject
	parser := #letter asParser2.
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2PredicateObjectRecognizer  