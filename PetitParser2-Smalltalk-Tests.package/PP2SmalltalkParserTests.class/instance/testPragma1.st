testing-pragmas
testPragma1
	super testPragma1.
	self 
		assert: result pragmas
		format: #('<foo>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty