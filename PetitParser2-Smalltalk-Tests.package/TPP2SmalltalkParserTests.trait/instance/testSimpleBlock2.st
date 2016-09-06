testing-blocks
testSimpleBlock2
	super testSimpleBlock2.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1