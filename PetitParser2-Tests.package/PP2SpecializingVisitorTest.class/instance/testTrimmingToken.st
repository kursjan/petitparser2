tests
testTrimmingToken
	parser := $a asPParser plus token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingToken.
	self assert: parser strategy trimmer equals: parser trimmer.
	self assert: parser strategy tokenClass equals: parser child tokenClass.