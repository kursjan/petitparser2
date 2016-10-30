tests
testChoiceNonIdentical
	| productionOne productionTwo |
	productionOne := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	productionTwo := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := productionOne / ($a asPParser optional, productionTwo wrapped).
	
	self visit: parser.
	
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy == productionTwo strategy.	