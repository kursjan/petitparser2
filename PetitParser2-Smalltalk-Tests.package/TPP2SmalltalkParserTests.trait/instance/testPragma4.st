testing-pragmas
testPragma4
	super testPragma4.
	self assert: self result pragmas format: #('<foo>').
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.	
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty