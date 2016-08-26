testing-blocks
testStatementBlock3
	super testStatementBlock3.
	self assert: result isBlock.
	self assert: result arguments isEmpty.
	self assert: result body temporaries size equals: 2.
	self assert: result body statements size equals: 1