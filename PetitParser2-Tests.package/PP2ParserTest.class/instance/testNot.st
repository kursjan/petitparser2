test - parsing
testNot
	| parser |
	parser := 'foo' asParser2 flatten, 'bar' asParser2 flatten not.
	
	self assert: parser parse: 'foobaz' to: #('foo' nil) end: 3.
	self assert: parser fail: 'foobar' end: 3