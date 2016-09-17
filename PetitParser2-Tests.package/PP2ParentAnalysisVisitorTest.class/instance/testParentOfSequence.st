tests
testParentOfSequence
	| parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	parent := parserOne, parserTwo.
	
	visitor visit: parent.
	
	self assert: parserOne parents size equals: 1.
	self assert: parserOne parents includes: parent.
	self assert: parserTwo parents size equals: 1.
	self assert: parserTwo parents includes: parent.
	self assert: parent parents isEmpty.