testing-blocks
testStatementBlock3
	super testStatementBlock3.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 2.
	self assert: self result body statements size equals: 1