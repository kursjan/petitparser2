tests
testChoice
	| parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
		
	firstSet := self firstSet: parserOne / parserTwo.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo.