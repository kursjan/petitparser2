tests
testAnd
	| parser |
	parser := 'foo' asParser2, 'bar' asParser2 and.
	self
		assert: parser
		parse: 'foobar'
		to: #('foo' 'bar')
		end: 3.

	self assert: parser fail: 'foobaz' end: 3.