testing-blocks
testArgumentsBlock3
	super testArgumentsBlock3.
	self assert: result isBlock.
	self assert: result arguments size equals: 3.
	self assert: result arguments first isVariable.
	self assert: result arguments first name equals: 'a'.
	self assert: result arguments second isVariable.
	self assert: result arguments second name equals: 'b'.
	self assert: result arguments third isVariable.
	self assert: result arguments third name equals: 'c'.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty