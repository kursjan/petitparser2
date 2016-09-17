tests
testTrimmingLiteralObjectToken
	parser := $a asPParser token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingLiteralObjectToken.
	self assert: parser strategy literal equals: $a.	