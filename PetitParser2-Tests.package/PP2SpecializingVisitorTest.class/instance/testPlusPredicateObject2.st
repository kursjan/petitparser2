tests
testPlusPredicateObject2
	parser := #letter asParser2 plus.
	parser max: 20.
	
	visitor visit: parser.
	self reject: parser strategy isKindOf: PP2PlusPredicateObject.