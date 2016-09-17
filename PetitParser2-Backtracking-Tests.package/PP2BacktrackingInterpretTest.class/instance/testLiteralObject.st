test
testLiteralObject
	| parser |
	parser := $a asPParser.
	
	self assert: parser literal equals: $a.
	self assert: parser message equals: 'literal $a expected'.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'