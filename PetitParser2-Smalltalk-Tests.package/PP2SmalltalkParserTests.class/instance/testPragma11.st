testing-pragmas
testPragma11
	super testPragma11.
	self 
		assert: result pragmas
		format: #('<foo: true>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty