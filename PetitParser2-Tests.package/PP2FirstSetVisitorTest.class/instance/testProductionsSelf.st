tests - productions
testProductionsSelf
	parser := 'foo' asPParser name: 'bar'.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 1.
	self assert: (firstSet includes: parser)