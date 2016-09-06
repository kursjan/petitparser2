testing-pragmas
testPragma2
	super testPragma2.
	self 
		assert: self result pragmas
		format: #('<foo>' '<bar>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result pragmas second keywordsPositions equals: #(15) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty