testing-blocks
testArgumentsBlock1
	super testArgumentsBlock1.
	self assert: result isBlock.
	self assert: result arguments size equals: 1.
	self assert: result arguments first isVariable.
	self assert: result arguments first name equals: 'a'.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty