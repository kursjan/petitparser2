tests - productions
testProductionsSelf
	parser := 'foo' asParser2 name: 'bar'.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 1.
	self assert: (firstSet includes: parser)