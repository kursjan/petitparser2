tests
testStarPredicateObject2
	parser := #letter asParser2 star.
	parser max: 2.
	
	visitor visit: parser.
	self reject: parser strategy isKindOf: PP2StarPredicateObject.