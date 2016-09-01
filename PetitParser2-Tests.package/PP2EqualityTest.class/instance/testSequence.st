tests
testSequence
	parserOne := $a asParser2, #word asParser2.
	parserTwo := $a asParser2, #word asParser2.
	
	self deny:   parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.