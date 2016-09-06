testing-pragmas
testPragma13
	super testPragma13.
	self 
		assert: self result pragmas
		format: #('<foo: nil>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty