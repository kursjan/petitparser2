testing-pragmas
testPragma17
	super testPragma17.
	self 
		assert: self result pragmas
		format: #('<foo: 1 bar: 2>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9 16) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty