tests - tokens
testFirstWithTokensTwoTokens
	| tokenOne tokenTwo trimmer |
	trimmer := $c asPParser.
	tokenOne := $a asPParser token.
	tokenTwo := $b asPParser token trim: trimmer.
	
	firstSet := self firstSetWithTokens: tokenOne / tokenTwo.
	
	self assert: firstSet size equals: 3.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo child.
	self assert: firstSet includes: tokenTwo trimmer.