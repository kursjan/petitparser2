testing-blocks
testSimpleBlock2
	super testSimpleBlock2.
	self assert: result isBlock.
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements size equals: 1