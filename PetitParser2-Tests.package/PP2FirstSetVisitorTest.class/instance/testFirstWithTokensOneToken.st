tests - tokens
testFirstWithTokensOneToken
	| token  |
	token := $a asParser2 token.
	parser := $b asParser2.
	
	firstSet := self firstSetWithTokens: token / parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: token.
	self assert: firstSet includes: parser.