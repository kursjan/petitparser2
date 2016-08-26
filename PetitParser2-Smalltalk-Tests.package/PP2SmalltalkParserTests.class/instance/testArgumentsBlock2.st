testing-blocks
testArgumentsBlock2
	super testArgumentsBlock2.
	self assert: result isBlock.
	self assert: result arguments size equals: 2.
	self assert: result arguments first isVariable.
	self assert: result arguments first name equals: 'a'.
	self assert: result arguments second isVariable.
	self assert: result arguments second name equals: 'b'.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty