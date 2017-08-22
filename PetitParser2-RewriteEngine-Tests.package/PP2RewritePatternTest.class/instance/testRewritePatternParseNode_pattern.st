tests
testRewritePatternParseNode_pattern
	| parser |
	parser := ($a asPParser token, $b asPParser token) parseNode enablePatternMatching.
	
	self assert: parser parse: '`c`'.
	self assert: result isParseNode.
	self assert: result isPatternParseNode.