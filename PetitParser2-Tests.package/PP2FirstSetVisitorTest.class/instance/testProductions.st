tests - productions
testProductions
	| productionOne productionTwo |
	productionOne := 'foo' asParser2 name: 'bar'.
	productionTwo := 'bar' asParser2 name: 'baz'.
	parser := productionOne / productionTwo.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 2.
	self assert: (firstSet includes: productionOne).
	self assert: (firstSet includes: productionTwo).	