testing
testVariable3
	super testVariable3.
	self assert: self result isVariable.
	self assert: self result name equals: 'nilly'