testing-pragmas
testPragma5
	super testPragma5.
	self assert: result pragmas format: #('<foo>' '<bar>').
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: result pragmas second keywordsPositions equals: #(21) asIntegerArray.	
	self assert: result body temporaries size equals: 1.
	self assert: result body statements isEmpty