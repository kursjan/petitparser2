tests
testOptionalLiteraObject
	parser := $a asParser2 optional.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2OptionalLiteralObject.