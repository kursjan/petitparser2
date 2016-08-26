testing-blocks
testSimpleBlock1
	super testSimpleBlock1.
	self assert: result isBlock.
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty