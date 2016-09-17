tests
testStar
	parser := $a asPParser star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2Star.