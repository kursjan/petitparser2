as yet unclassified
testChoiceNonIdentical
	| productionOne productionTwo |
	productionOne := 'foo' asParser2 plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	productionTwo := 'foo' asParser2 plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := productionOne / ($a asParser2 optional, productionTwo wrapped).
	
	self visit: parser.
	
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy == productionTwo strategy.	