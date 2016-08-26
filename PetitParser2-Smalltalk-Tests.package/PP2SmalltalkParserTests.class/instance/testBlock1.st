testing-blocks
testBlock1
	super testBlock1.
	self assert: result isBlock.
	self assert: result arguments size equals: 0.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty