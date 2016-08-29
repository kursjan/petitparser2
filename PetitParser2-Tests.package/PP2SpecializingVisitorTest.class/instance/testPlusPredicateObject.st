tests
testPlusPredicateObject
	parser := #letter asParser2 plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2PlusPredicateObject.