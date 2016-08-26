testing-pragmas
testPragma17
	super testPragma17.
	self 
		assert: result pragmas
		format: #('<foo: 1 bar: 2>' ).
	self assert: result pragmas first keywordsPositions equals: #(9 16) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty