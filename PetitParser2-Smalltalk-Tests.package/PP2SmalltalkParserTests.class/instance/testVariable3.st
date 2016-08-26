testing
testVariable3
	super testVariable3.
	self assert: result isVariable.
	self assert: result name equals: 'nilly'