testing-pragmas
testPragma3
	super testPragma3.
	self assert: self result pragmas format: #('<foo>').
	self assert: self result pragmas first keywordsPositions equals: #(15) asIntegerArray.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty