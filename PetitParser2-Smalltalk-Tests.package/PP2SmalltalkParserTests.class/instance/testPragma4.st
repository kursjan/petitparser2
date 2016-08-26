testing-pragmas
testPragma4
	super testPragma4.
	self assert: result pragmas format: #('<foo>').
	self assert: result pragmas first keywordsPositions equals: #(9) asIntegerArray.	
	self assert: result body temporaries size equals: 1.
	self assert: result body statements isEmpty