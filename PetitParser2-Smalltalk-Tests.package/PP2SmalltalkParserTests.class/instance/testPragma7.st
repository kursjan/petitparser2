testing-pragmas
testPragma7
	super testPragma7.
	self 
		assert: result pragmas
		format: #('<foo: 1.2>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty