testing-pragmas
testPragma14
	super testPragma14.
	self 
		assert: self result pragmas
		format: #('<foo: #()>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty