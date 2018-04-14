test
testNonEpsilon
	|  parser |
	parser := $a asPParser optional nonEpsilon.
	
	self assert: parser fail: ''.
	self assert: parser parse: 'a'