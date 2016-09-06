testing-blocks
testArgumentsBlock3
	super testArgumentsBlock3.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result arguments third isVariable.
	self assert: self result arguments third name equals: 'c'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty