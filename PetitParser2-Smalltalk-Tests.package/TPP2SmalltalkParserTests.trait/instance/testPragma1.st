testing-pragmas
testPragma1
	super testPragma1.
	self 
		assert: self result pragmas
		format: #('<foo>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty