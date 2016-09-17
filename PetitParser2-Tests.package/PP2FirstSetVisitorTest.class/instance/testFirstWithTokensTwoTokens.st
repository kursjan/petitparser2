tests - tokens
testFirstWithTokensTwoTokens
	| tokenOne tokenTwo |
	tokenOne := $a asPParser token.
	tokenTwo := $b asPParser token trim.
	
	self assert: (tokenTwo isKindOf: PP2TrimmingTokenNode).
	
	firstSet := self firstSetWithTokens: tokenOne / tokenTwo.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo.