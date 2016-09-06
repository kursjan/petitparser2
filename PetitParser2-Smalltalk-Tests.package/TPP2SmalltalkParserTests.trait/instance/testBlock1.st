testing-blocks
testBlock1
	super testBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 0.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty