testing-blocks
testArgumentsBlock2
	super testArgumentsBlock2.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty