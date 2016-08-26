testing-blocks
testStatementBlock2
	super testStatementBlock2.
	self assert: result isBlock.
	self assert: result arguments isEmpty.
	self assert: result body temporaries size equals: 1.
	self assert: result body statements size equals: 1