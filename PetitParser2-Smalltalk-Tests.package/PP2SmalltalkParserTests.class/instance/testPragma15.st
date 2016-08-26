testing-pragmas
testPragma15
	super testPragma15.
	self 
		assert: result pragmas
		format: #('<foo: #()>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty