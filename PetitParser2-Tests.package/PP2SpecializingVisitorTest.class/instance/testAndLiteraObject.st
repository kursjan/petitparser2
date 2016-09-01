tests
testAndLiteraObject
	parser := $a asParser2 and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndLiteralObject.