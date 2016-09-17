tests
testFlatten
	| flattened |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	flattened := parser flatten.
	
	self visit: flattened.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 