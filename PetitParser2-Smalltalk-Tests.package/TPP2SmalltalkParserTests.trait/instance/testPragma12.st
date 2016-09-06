testing-pragmas
testPragma12
	super testPragma12.
	self 
		assert: self result pragmas
		format: #('<foo: false>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty