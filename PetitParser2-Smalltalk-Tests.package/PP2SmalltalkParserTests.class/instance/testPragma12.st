testing-pragmas
testPragma12
	super testPragma12.
	self 
		assert: result pragmas
		format: #('<foo: false>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty