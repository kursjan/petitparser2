tests
testPredicateObject
	parserOne := #space asPParser.
	parserTwo := #space asPParser.
	
	self deny:   parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.