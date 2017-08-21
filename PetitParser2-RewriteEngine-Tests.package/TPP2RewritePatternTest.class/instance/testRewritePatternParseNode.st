tests
testRewritePatternParseNode
	| parser |
	parser := ($a asPParser token, $b asPParser token) parseNode enablePatternMatching.
	
	self assert: parser parse: 'ab'.
	self assert: result isParseNode.
	self deny: result isPatternParseNode