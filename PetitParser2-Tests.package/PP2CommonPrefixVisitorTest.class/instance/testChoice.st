as yet unclassified
testChoice
	| production |
	production := 'foo' asParser2 plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := production / ($a asParser2 optional, production wrapped).
	
	self visit: parser.
	
	self assert: production strategy isKindOf: PP2Cache.