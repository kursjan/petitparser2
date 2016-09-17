tests
testPlusPredicateObject
	parser := #letter asPParser plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2PlusPredicateObject.