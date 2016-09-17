tests
testSequenceWithNil
	| sequence parserOne parserTwo |
	parserOne := nil asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parserTwo