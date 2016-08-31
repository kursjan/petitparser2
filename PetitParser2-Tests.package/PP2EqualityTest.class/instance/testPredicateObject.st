tests
testPredicateObject
	parserOne := #space asParser2.
	parserTwo := #space asParser2.
	
	self reject: parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.