tests
testSequenceWithNil
	| sequence parserOne parserTwo |
	parserOne := nil asParser2.
	parserTwo := $b asParser2.
	sequence := parserOne, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parserTwo