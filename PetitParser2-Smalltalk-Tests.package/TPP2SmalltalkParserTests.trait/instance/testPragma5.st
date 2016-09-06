testing-pragmas
testPragma5
	super testPragma5.
	self assert: self result pragmas format: #('<foo>' '<bar>').
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result pragmas second keywordsPositions equals: #(21) asIntegerArray.	
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty