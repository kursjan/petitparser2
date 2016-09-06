testing-pragmas
testPragma16
	super testPragma16.
	self 
		assert: self result pragmas
		format: #('< + 1>' ).
	self assert: self result pragmas first keywordsPositions equals: #(10) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty