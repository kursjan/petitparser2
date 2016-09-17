tests
testAndPredicateObject
	parser := #letter asPParser and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndPredicateObject