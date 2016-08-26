testing-pragmas
testPragma18
	super testPragma18.
	self 
		assert: result pragmas
		format: #('<foo: 1 bar: 2 baz: #b>' ).
	self assert: result pragmas first keywordsPositions equals: #(9 16 24) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty