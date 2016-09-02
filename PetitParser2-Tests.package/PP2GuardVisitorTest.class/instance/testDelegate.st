tests
testDelegate
	parser := 'foo' asParser2 plus flatten wrapped.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy classification isNotNil.