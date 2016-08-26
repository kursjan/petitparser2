testing-pragmas
testPragma9
	super testPragma9.
	self 
		assert: result pragmas
		format: #('<foo: #bar>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty