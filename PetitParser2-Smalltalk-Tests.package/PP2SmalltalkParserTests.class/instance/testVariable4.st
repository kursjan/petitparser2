testing
testVariable4
	super testVariable4.
	self assert: result isVariable.
	self assert: result name equals: 'selfish'