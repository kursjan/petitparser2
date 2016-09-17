tests
testStarPredicateObject2
	parser := #letter asPParser star.
	parser max: 2.
	
	visitor visit: parser.
	self deny: parser strategy isKindOf: PP2StarPredicateObject.