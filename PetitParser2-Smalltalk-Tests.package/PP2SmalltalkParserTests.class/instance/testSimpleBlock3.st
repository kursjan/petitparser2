testing-blocks
testSimpleBlock3
	super testSimpleBlock3.
	self assert: result isBlock.
	self assert: result arguments size equals: 1.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty