testing
testVariable1
	super testVariable1.
	self assert: result isVariable.
	self assert: result name equals: 'trueBinding'