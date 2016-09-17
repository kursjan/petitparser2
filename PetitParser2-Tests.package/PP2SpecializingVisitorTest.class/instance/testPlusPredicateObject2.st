tests
testPlusPredicateObject2
	parser := #letter asPParser plus.
	parser max: 20.
	
	visitor visit: parser.
	self deny: parser strategy isKindOf: PP2PlusPredicateObject.