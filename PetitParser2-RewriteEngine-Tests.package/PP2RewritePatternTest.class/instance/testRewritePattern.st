tests
testRewritePattern
	| parser |
	parser := $a asPParser enablePatternMatching.
	
	self assert: parser parse: 'a'.
	self assert: parser fail: '`c`'.