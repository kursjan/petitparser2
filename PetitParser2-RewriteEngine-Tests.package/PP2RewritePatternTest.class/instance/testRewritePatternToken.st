tests
testRewritePatternToken
	| parser |
	parser := $a asPParser token enablePatternMatching.
	
	self assert: parser parse: 'a'.
	self assert: result isKindOf: PP2Token.
	self assert: result value = 'a'.