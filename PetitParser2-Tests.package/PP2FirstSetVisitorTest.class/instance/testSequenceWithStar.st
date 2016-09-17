tests
testSequenceWithStar
	| sequence parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne star, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo