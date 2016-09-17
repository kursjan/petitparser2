as yet unclassified
testSequence
	| production |
	production := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := (production, $a asPParser) star, production wrapped.
	
	self visit: parser.
	
	self assert: production strategy isKindOf: PP2Cache.