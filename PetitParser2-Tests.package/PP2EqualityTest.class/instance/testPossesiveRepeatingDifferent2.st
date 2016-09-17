tests
testPossesiveRepeatingDifferent2
	parserOne := #space asPParser star.
	parserTwo := #blank asPParser star.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.