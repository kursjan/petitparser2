tests
testPossesiveRepeatingDifferent2
	parserOne := #space asParser2 star.
	parserTwo := #blank asParser2 star.
	
	self reject: parserOne == parserTwo.
	self reject: parserOne equals: parserTwo.
	
	self reject: parserOne hash equals: parserTwo hash.