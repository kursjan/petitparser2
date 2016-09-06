testing-pragmas
testPragma6
	super testPragma6.
	self 
		assert: self result pragmas
		format: #('<foo: 1>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty