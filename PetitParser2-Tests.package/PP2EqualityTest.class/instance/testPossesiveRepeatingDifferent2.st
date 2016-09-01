tests
testPossesiveRepeatingDifferent2
	parserOne := #space asParser2 star.
	parserTwo := #blank asParser2 star.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.