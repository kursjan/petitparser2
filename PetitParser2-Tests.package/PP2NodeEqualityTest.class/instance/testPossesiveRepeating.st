tests
testPossesiveRepeating
	parserOne := #space asPParser star.
	parserTwo := #space asPParser star.
	
	self deny:  	 parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.