testing-pragmas
testPragma18
	super testPragma18.
	self 
		assert: self result pragmas
		format: #('<foo: 1 bar: 2 baz: #b>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9 16 24) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty