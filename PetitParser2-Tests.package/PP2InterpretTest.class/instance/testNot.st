tests
testNot
	| parser |
	parser := 'foo' asParser2, 'bar' asParser2  not.
	
	self assert: parser parse: 'foobaz' to: #('foo' nil) end: 3.
	self assert: parser fail: 'foobar' end: 3