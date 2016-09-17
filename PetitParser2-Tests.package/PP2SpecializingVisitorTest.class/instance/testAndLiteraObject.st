tests
testAndLiteraObject
	parser := $a asPParser and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndLiteralObject.