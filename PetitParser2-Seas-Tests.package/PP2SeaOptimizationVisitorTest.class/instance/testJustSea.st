tests
testJustSea
	parser := $a asPParser sea.
	
	self visit: parser.
	self assert: parser strategy isKindOf: PP2Sea