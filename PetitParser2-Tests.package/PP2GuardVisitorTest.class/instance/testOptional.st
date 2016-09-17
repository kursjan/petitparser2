tests
testOptional
	parser := 'foo' asPParser token trim optional.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval isNil.