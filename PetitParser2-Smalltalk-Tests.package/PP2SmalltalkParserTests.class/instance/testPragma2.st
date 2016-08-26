testing-pragmas
testPragma2
	super testPragma2.
	self 
		assert: result pragmas
		format: #('<foo>' '<bar>' ).
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: result pragmas second keywordsPositions equals: #(15) asIntegerArray.		
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty