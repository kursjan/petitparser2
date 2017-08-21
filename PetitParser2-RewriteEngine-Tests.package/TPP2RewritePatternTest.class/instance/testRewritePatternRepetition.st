tests
testRewritePatternRepetition
	| parser aParser |
	aParser := $a asPParser token parseNode.
	parser := (aParser star) parseNode enablePatternMatching.
	
	self assert: parser parse: ''.
	self assert: parser parse: 'a'.
	self assert: parser parse: 'aa'.
	self assert: parser parse: '`c`'.
	self assert: parser parse: 'a`c`'.	
	self assert: parser parse: '`c`a'.	
	self assert: parser parse: 'a`c`a'.		