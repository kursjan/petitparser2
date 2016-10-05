tests
testSequence
	parserOne := $a asPParser, #word asPParser.
	parserTwo := $a asPParser, #word asPParser.
	
	self deny:   parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.