test
testNot
	| parser |
	parser := 'foo' asPParser, 'bar' asPParser  not.
	
	self assert: parser parse: 'foobaz' to: #('foo' nil) end: 3.
	self assert: parser fail: 'foobar' end: 3