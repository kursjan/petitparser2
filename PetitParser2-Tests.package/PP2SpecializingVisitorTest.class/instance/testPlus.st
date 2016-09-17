tests
testPlus
	parser := $a asPParser plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2Plus.