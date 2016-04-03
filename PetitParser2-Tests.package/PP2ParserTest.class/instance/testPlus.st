test - parsing (deprecated)
testPlus
	| parser |
	parser := $a asParser2 plus.
	self assert: parser min equals: 1.
	self assert: parser max > parser min.
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a $a).
	self
		assert: parser
		parse: 'ab'
		to: #($a)
		end: 1.
	self
		assert: parser
		parse: 'aab'
		to: #($a $a)
		end: 2.
	self
		assert: parser
		parse: 'aaab'
		to: #($a $a $a)
		end: 3.
	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'ba'