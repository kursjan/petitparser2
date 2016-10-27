tests
testSeaWaterTokens
	| sea waterToken tokenOne tokenTwo |
	parser := $a asPParser.
	tokenOne := $b asPParser.
	tokenTwo := $c asPParser.
	waterToken := tokenOne / tokenTwo.
	
	sea := parser sea: waterToken.
	firstSet := self firstSetWithoutDuplicates: sea.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo.