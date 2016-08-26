testing-pragmas
testPragma3
	super testPragma3.
	self assert: result pragmas format: #('<foo>').
	self assert: result pragmas first keywordsPositions equals: #(15) asIntegerArray.
	self assert: result body temporaries size equals: 1.
	self assert: result body statements isEmpty