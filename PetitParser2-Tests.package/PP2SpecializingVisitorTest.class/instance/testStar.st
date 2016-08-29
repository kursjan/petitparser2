tests
testStar
	parser := $a asParser2 star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2Star.