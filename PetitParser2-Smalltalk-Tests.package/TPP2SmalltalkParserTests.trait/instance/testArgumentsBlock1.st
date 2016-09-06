testing-blocks
testArgumentsBlock1
	super testArgumentsBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty