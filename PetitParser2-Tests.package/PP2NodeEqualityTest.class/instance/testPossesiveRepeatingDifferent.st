tests
testPossesiveRepeatingDifferent
	parserOne := #space asPParser star.
	parserTwo := #space asPParser plus.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.