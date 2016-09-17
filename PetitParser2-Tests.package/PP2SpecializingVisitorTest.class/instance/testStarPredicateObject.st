tests
testStarPredicateObject
	parser := #letter asPParser star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObject.