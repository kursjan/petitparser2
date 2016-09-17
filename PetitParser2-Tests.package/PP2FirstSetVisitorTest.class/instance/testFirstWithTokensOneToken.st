tests - tokens
testFirstWithTokensOneToken
	| token  |
	token := $a asPParser token.
	parser := $b asPParser.
	
	firstSet := self firstSetWithTokens: token / parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: token.
	self assert: firstSet includes: parser.