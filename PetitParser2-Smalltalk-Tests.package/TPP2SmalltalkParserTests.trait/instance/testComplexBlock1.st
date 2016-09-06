testing-blocks
testComplexBlock1
	super testComplexBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1