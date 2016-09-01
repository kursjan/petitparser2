tests
testNotLiteraObject
	parser := $a asParser2 not.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2NotLiteralObject.