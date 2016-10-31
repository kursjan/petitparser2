tests
testSea
	| island |
	island := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := island sea.
	
	self visit: parser.
	
	self assert: island strategy isKindOf: PP2Cache.