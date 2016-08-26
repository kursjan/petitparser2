testing-pragmas
testPragma6
	super testPragma6.
	self 
		assert: result pragmas
		format: #('<foo: 1>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty