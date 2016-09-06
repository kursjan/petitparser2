testing
testVariable4
	super testVariable4.
	self assert: self result isVariable.
	self assert: self result name equals: 'selfish'