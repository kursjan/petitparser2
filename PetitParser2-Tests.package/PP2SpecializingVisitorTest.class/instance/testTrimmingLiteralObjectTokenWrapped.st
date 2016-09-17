tests
testTrimmingLiteralObjectTokenWrapped
	parser := $a asPParser wrapped token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingLiteralObjectToken.
	self assert: parser strategy literal equals: $a.