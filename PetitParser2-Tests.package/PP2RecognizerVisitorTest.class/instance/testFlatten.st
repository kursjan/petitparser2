tests
testFlatten
	| flattened |
	parser := #letter asParser2 star.
	parser strategy: (PP2StarPredicateObject on: parser).
	flattened := parser flatten.
	
	self visit: flattened.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 