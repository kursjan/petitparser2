testing-blocks
testComplexBlock2
	super testComplexBlock2.
	self assert: result isBlock.
	self assert: result arguments size equals: 1.
	self assert: result body temporaries size equals: 1.
	self assert: result body statements size equals: 1