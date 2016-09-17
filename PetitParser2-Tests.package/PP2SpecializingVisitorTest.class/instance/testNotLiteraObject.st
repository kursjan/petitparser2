tests
testNotLiteraObject
	parser := $a asPParser not.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2NotLiteralObject.