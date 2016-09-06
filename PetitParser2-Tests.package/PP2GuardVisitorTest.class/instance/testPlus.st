tests
testPlus
	parser := 'foo' asParser2 token trim plus.
	parser strategy: (PP2Plus on: parser).
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval isPetit2Failure.