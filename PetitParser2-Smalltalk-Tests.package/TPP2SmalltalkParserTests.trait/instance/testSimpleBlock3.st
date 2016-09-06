testing-blocks
testSimpleBlock3
	super testSimpleBlock3.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty