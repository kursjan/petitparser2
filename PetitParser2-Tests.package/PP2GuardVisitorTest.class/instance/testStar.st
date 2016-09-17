tests
testStar
	parser := 'foo' asPParser token trim star.
	parser strategy: (PP2Star on: parser).
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval equals: #().