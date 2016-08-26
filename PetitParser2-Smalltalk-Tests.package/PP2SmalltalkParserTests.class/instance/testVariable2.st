testing
testVariable2
	super testVariable2.
	self assert: result isVariable.
	self assert: result name equals: 'falseBinding'