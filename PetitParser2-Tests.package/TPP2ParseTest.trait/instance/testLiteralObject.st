test
testLiteralObject
	| parser |
	parser := $a asParser2.
	
	self assert: parser literal equals: $a.
	self assert: parser message equals: 'literal $a expected'.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'