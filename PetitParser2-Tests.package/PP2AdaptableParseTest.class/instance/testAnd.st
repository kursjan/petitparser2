test
testAnd
	| parser |
	parser := 'foo' asPParser, 'bar' asPParser and.
	self
		assert: parser
		parse: 'foobar'
		to: #('foo' 'bar')
		end: 3.

	self assert: parser fail: 'foobaz' end: 3.