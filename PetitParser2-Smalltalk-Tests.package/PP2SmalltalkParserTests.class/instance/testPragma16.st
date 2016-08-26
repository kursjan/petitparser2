testing-pragmas
testPragma16
	super testPragma16.
	self 
		assert: result pragmas
		format: #('< + 1>' ).
	self assert: result pragmas first keywordsPositions equals: #(10) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty