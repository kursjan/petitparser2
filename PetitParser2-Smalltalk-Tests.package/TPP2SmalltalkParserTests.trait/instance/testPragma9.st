testing-pragmas
testPragma9
	super testPragma9.
	self 
		assert: self result pragmas
		format: #('<foo: #bar>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty