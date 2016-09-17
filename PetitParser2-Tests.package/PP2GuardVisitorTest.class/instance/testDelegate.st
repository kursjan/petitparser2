tests
testDelegate
	parser := 'foo' asPParser plus flatten wrapped.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy classification isNotNil.