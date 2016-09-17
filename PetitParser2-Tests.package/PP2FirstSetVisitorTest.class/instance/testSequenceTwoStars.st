tests
testSequenceTwoStars
	| sequence parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne star, parserTwo star.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo.
	self assert: firstSet includes: PP2EpsilonNode instance