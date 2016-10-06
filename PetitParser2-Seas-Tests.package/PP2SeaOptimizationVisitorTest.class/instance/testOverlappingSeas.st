tests
testOverlappingSeas
	| seaOne seaTwo |
	seaOne := $a asPParser sea.
	seaTwo := $b asPParser sea.
	
	parser := seaOne, seaTwo.
	
	self visit: parser.
	self assert: seaOne strategy isKindOf: PP2Sea.
	self assert: seaTwo strategy isKindOf: PP2Sea.
	self assert: seaOne afterWater allNodes noneSatisfy: [ :n | n isSea ]