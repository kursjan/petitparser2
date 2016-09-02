tests
testPossesiveRepeating
	parser := 'foo' asParser2 token trim star.
	
	self optimize: parser.
	
	self assert: parser child strategy isKindOf: PP2ParsingGuard.
	self assert: parser child strategy classification isNotNil.