tests
testStarPredicateObject
	parser := #letter asParser2 star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObject.