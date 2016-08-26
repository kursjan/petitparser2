testing-blocks
testStatementBlock1
	super testStatementBlock1.
	self assert: result isBlock.
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements size equals: 1