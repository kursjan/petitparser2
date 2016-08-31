tests - tokens
testFirstWithTokensTwoTokens
	| tokenOne tokenTwo |
	tokenOne := $a asParser2 token.
	tokenTwo := $b asParser2 token trim.
	
	self assert: (tokenTwo isKindOf: PP2TrimmingTokenParser).
	
	firstSet := self firstSetWithTokens: tokenOne / tokenTwo.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo.