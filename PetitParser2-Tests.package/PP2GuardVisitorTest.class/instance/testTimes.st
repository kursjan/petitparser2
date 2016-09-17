tests
testTimes
	parser := 'foo' asPParser token trim times: 3.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy classification isNotNil.
	self assert: parser strategy retval isPetit2Failure