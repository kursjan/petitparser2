testing-pragmas
testPragma11
	super testPragma11.
	self 
		assert: self result pragmas
		format: #('<foo: true>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty