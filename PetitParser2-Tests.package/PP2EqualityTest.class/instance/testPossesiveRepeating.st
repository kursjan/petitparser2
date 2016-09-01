tests
testPossesiveRepeating
	parserOne := #space asParser2 star.
	parserTwo := #space asParser2 star.
	
	self deny:  	 parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.