tests
testDelegateWithOptional
	parser := ('foo' asPParser / 'bar' asPParser optional) wrapped.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2Delegate.