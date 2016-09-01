tests
testAndPredicateObject
	parser := #letter asParser2 and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndPredicateObject