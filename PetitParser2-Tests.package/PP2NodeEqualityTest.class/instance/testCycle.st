tests
testCycle
	parserOne := PP2DelegateNode new.
	parserTwo := PP2DelegateNode new.
	
	parserOne child: parserTwo.
	parserTwo child: parserOne.
	
	self deny:  parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.