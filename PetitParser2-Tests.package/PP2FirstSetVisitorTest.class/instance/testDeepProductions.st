tests - productions
testDeepProductions
	| productionTop productionOne productionTwo |
	productionOne := 'foo' asPParser name: 'bar'.
	productionTwo := 'bar' asPParser name: 'baz'.
	productionTop := (productionOne / productionTwo) wrapped name: 'bark'.
	parser := productionTop plus.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 3.
	self assert: (firstSet includes: productionOne).
	self assert: (firstSet includes: productionTwo).	
	self assert: (firstSet includes: productionTop).		