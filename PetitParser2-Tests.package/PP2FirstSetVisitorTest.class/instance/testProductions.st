tests - productions
testProductions
	| productionOne productionTwo |
	productionOne := 'foo' asPParser name: 'bar'.
	productionTwo := 'bar' asPParser name: 'baz'.
	parser := productionOne / productionTwo.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 2.
	self assert: (firstSet includes: productionOne).
	self assert: (firstSet includes: productionTwo).	