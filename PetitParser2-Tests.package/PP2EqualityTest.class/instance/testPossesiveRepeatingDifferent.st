tests
testPossesiveRepeatingDifferent
	parserOne := #space asParser2 star.
	parserTwo := #space asParser2 plus.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.