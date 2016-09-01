tests
testPossesiveRepeatingDifferent
	parserOne := #space asParser2 star.
	parserTwo := #space asParser2 plus.
	
	self reject: parserOne == parserTwo.
	self reject: parserOne equals: parserTwo.
	
	self reject: parserOne hash equals: parserTwo hash.