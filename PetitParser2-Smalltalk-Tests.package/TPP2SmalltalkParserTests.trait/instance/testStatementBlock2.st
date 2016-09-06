testing-blocks
testStatementBlock2
	super testStatementBlock2.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1