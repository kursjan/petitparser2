tests
testSea
	| production |
	production := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := production sea.
	
	self visit: parser.
	
	self assert: production strategy isKindOf: PP2Cache.