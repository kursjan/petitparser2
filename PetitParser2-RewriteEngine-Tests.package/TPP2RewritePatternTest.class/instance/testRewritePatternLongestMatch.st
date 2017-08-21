tests
testRewritePatternLongestMatch
	| parser aParser |
	aParser := $a asPParser token parseNode.
	parser := (aParser, aParser) parseNode enablePatternMatching.
	
	self assert: parser parse: 'aa'.
	self assert: parser parse: '`c`'.
	self assert: parser parse: 'a`c`'.	
	self assert: parser parse: '`c`a'.	