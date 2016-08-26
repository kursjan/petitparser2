testing-pragmas
testPragma13
	super testPragma13.
	self 
		assert: result pragmas
		format: #('<foo: nil>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty