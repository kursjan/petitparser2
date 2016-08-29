tests
testToken
	parser := #letter asParser2 star.
	parser strategy: (PP2StarPredicateObject on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 