testing-blocks
testSimpleBlock1
	super testSimpleBlock1.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty