tests
testOptionalLiteraObject
	parser := $a asPParser optional.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2OptionalLiteralObject.